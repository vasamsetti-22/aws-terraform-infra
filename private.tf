resource "aws_subnet" "pvt" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/17"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "pvt"
  }
}

resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.pub.id

  tags = {
    Name = "NAT"
  }
}

resource "aws_route_table" "pvt-route-table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "pvt-route-table"
  }
}

resource "aws_route" "pvt-route" {
  route_table_id         = aws_route_table.pvt-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
  depends_on             = [aws_route_table.pvt-route-table]
}

resource "aws_route_table_association" "pvt-rta" {
  subnet_id      = aws_subnet.pvt.id
  route_table_id = aws_route_table.pvt-route-table.id
}