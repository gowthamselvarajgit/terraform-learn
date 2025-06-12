provider "aws" {
  region = var.region
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow http traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_http.id]

  # Install Apache2 and PHP
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y apache2 php",
      "sudo systemctl start apache2",
      "sudo systemctl enable apache2"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  # Copy php file to instance
  provisioner "file" {
    source      = "mysql-connection.php"
    destination = "/tmp/mysql-connection.php"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  # Move file to Apache web directory
  provisioner "remote-exec" {
    inline = [
      "sudo mv /tmp/mysql-connection.php /var/www/html/",
      "sudo chown www-data:www-data /var/www/html/mysql-connection.php"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  # Check deployment from your system using curl
  provisioner "local-exec" {
    command = "sleep 30 && curl http://${self.public_ip}/mysql-connection.php > output.html"
  }

  tags = {
    Name = "Ubuntu-Web-Server"
  }
}
