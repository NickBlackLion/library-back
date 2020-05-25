resource "aws_subnet" "library_subnet_1" {
  cidr_block = "10.0.0.0/20"
  vpc_id = aws_vpc.library_vpc.id
  availability_zone = "eu-central-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "library_subnet_2" {
  cidr_block = "10.0.32.0/20"
  vpc_id = aws_vpc.library_vpc.id
  availability_zone = "eu-central-1b"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "library_subnet_3" {
  cidr_block = "10.0.16.0/20"
  vpc_id = aws_vpc.library_vpc.id
  availability_zone = "eu-central-1c"
  map_public_ip_on_launch = true
}
