#dev vpc
resource "aws_vpc" "dev_vpc" {
  cidr_block = "10.2.0.0/17"
}

#subnet 1
resource "aws_subnet" "dev_private_subnet_1" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = "10.2.4.0/22"

  tags = {
    Name        = "dev_private_subnet_1"
    Environment = "dev"
  }
}

#subnet 2
resource "aws_subnet" "dev_private_subnet_2" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = "10.2.8.0/22"

  tags = {
    Name        = "dev_private_subnet_2"
    Environment = "dev"
  }
}

#internet gateway(igw)
resource "aws_internet_gateway" "dev_igw" {
    vpc_id = aws_vpc.dev_vpc.id

    tags = {
      Name = "dev_igw"
      Environment = "dev"
    }
  
}

#route table
resource "aws_route_table" "dev_route_table" {
    vpc_id = aws_vpc.dev_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev_igw.id
    }
}

#route table association for dev subnet 1
resource "aws_route_table_association" "dev_private_subnet_1" {
  subnet_id = aws_subnet.dev_private_subnet_1.id
  route_table_id = aws_route_table.dev_route_table.id
}

#route table association for dev subnet 2
resource "aws_route_table_association" "dev_private_subnet_2" {
  subnet_id = aws_subnet.dev_private_subnet_2.id
  route_table_id = aws_route_table.dev_route_table.id
}
