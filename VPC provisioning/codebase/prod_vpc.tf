#prod vpc
resource "aws_vpc" "prod_vpc" {
  cidr_block = "10.0.0.0/17"
}

#subnet 1
resource "aws_subnet" "prod_private_subnet_1" {
  vpc_id     = aws_vpc.prod_vpc.id
  cidr_block = "10.0.4.0/22"

  tags = {
    Name        = "prod_private_subnet_1"
    Environment = "prod"
  }
}

#subnet 2
resource "aws_subnet" "prod_private_subnet_2" {
  vpc_id     = aws_vpc.prod_vpc.id
  cidr_block = "10.0.8.0/22"

  tags = {
    Name        = "prod_private_subnet_2"
    Environment = "prod"
  }
}

#internet gateway(igw)
resource "aws_internet_gateway" "prod_igw" {
    vpc_id = aws_vpc.prod_vpc.id

    tags = {
      Name = "prod_igw"
      Environment = "prod"
    }
  
}

#route table
resource "aws_route_table" "prod_route_table" {
    vpc_id = aws_vpc.prod_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.prod_igw.id
    }
}

#route table association for prod subnet 1
resource "aws_route_table_association" "prod_private_subnet_1" {
  subnet_id = aws_subnet.prod_private_subnet_1.id
  route_table_id = aws_route_table.prod_route_table.id
}

#route table association for prod subnet 2
resource "aws_route_table_association" "prod_private_subnet_2" {
  subnet_id = aws_subnet.prod_private_subnet_2.id
  route_table_id = aws_route_table.prod_route_table.id
}
