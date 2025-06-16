resource "aws_route_table" "this" {
  vpc_id = var.vpc_id
}

resource "aws_route_table_association" "this" {
  subnet_id = var.subnet_id
  route_table_id = aws_route_table.this.id
}

resource "aws_route" "route" {
  count = var.type == "igw" ?  1 : 0

  route_table_id = aws_route_table.this.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = var.igw_id
}