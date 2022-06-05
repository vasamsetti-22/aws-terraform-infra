resource "aws_subnet" "pub" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.128.0/17"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "pub"
  }
}
resource "aws_subnet" "pub2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.1.0.0/18"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "pub2"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "pub"
  }
}

resource "aws_route_table" "pub-route-table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "pub-route-table"
  }
}

resource "aws_route" "pub-route" {
  route_table_id         = aws_route_table.pub-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
  depends_on             = [aws_route_table.pub-route-table]
}

resource "aws_route_table_association" "pub-rta" {
  subnet_id      = aws_subnet.pub.id
  route_table_id = aws_route_table.pub-route-table.id
}
resource "aws_route_table_association" "pub2-rta" {
  subnet_id      = aws_subnet.pub2.id
  route_table_id = aws_route_table.pub-route-table.id
}