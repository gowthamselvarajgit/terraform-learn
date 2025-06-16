resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = var.public_subnet_id

  tags = {
    Name = "NAT-GT"
  }

  depends_on = [ aws_eip.nat_eip ]
}

resource "aws_route" "nat_route" {
  route_table_id = var.private_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat.id
}