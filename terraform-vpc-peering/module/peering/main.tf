resource "aws_vpc_peering_connection" "peer" {
  vpc_id = var.vpc_id_a
  peer_vpc_id = var.vpc_id_b
  auto_accept = true
  tags = {
    Name = "Peering-VPC-A-B"
  }
}

resource "aws_route_table" "rt_a" {
  vpc_id = var.vpc_id_a
  route {
    cidr_block = var.cidr_b
    vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  }

  tags = {
    Name = "RT-A"
  }
}

resource "aws_route_table_association" "rta_a" {
  subnet_id = var.subnet_a_id
  route_table_id = aws_route_table.rt_a.id
}

resource "aws_route_table" "rt_b" {
  vpc_id = var.vpc_id_b
  route {
    cidr_block = var.cidr_a
    vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  }

  tags = {
    Name = "RT-B"
  }
}

resource "aws_route_table_association" "rta_b" {
  subnet_id = var.subnet_b_id
  route_table_id = aws_route_table.rt_b.id
}