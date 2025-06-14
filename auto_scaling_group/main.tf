provider "aws" {
  region = var.region
}

// VPC, Subnet Creation with igw and rt
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "subnet1" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.subnet_cidr_1
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1a"
}

resource "aws_subnet" "subnet2" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.subnet_cidr_2
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1b"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route" "default" {
  route_table_id = aws_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "a1" {
  subnet_id = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "a2" {
  subnet_id = aws_subnet.subnet2.id
  route_table_id = aws_route_table.rt.id
}

//Seurity Group
resource "aws_security_group" "web_sg" {
  name = "web-sg"
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}

# AMI  LAUNCH TEMPLATE
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]  # Canonical (official Ubuntu owner ID)

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

resource "aws_launch_template" "web_lt" {
  name_prefix = "ubuntu-template-"
  image_id = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.web_sg.id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "ubuntu-web-server"
    }
  }

  user_data = base64encode( <<EOF

  #!/bin/bash
  sudo apt update -y
  sudo apt install apache2 -y
  sudo systemctl start apache2
  echo "<h1>Welcome to ubuntu Web Server - ASG</h1> | sudo tee /var/www/html/index.html

  EOF
  )
}

#APPLICATION LOAD BALANCER + TARGET GROUP

resource "aws_lb" "web_alb" {
  name = "web-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.web_sg.id]
  subnets = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
}

resource "aws_lb_target_group" "web_tg" {
  name = "web-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.main_vpc.id

  health_check {
    path = "/"
    protocol = "HTTP"
    interval = 30
    timeout = 5
    healthy_threshold = 5
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "web_listner" {
  load_balancer_arn = aws_lb.web_alb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}

#AUTO SCALING GROUP
resource "aws_autoscaling_group" "web_asg" {
  desired_capacity = 1
  max_size = 3
  min_size = 1
  vpc_zone_identifier = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  target_group_arns = [aws_lb_target_group.web_tg.arn]
  health_check_type = "ELB"
  health_check_grace_period = 300

  launch_template {
    id = aws_launch_template.web_lt.id
    version = "$Latest"
  }

  tag{
    key = "Name"
    value = "ubuntu-asg-instance"
    propagate_at_launch = true
  }
}

#SCALING POLICY
resource "aws_autoscaling_policy" "scale_cpu" {
  name = "scale-on-cpu"
  policy_type = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.web_asg.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50.0
  }
}