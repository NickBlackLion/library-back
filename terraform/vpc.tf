resource "aws_vpc" "library_vpc" {
  cidr_block = "10.0.0.0/16"

  enable_dns_hostnames = true
  enable_dns_support = true
}

resource "aws_route_table" "library" {
  vpc_id = aws_vpc.library_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.library.id
  }
}

resource "aws_internet_gateway" "library" {
  vpc_id = aws_vpc.library_vpc.id
}

resource "aws_route_table_association" "library_1" {
  route_table_id = aws_route_table.library.id
  subnet_id = aws_subnet.library_subnet_1.id
}

resource "aws_route_table_association" "library_2" {
  route_table_id = aws_route_table.library.id
  subnet_id = aws_subnet.library_subnet_2.id
}

resource "aws_route_table_association" "library_3" {
  route_table_id = aws_route_table.library.id
  subnet_id = aws_subnet.library_subnet_3.id
}
