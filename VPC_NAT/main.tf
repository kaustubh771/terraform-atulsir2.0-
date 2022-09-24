
#Creation VPC

resource "aws_vpc" "devops_vpc" {
  cidr_block = "10.0.0.0/18"

  tags = {
    Name = "devops_vpc"
  }
}

#Creating public subnet

resource "aws_subnet" "public_Subnet" {
  vpc_id     = aws_vpc.devops_vpc.id
  cidr_block = "10.0.0.0/24"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Public Subnet"
  }
}

#creating private subnet

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.devops_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "Private subnet"
  }
}

#Creating IGW

resource "aws_internet_gateway" "Igw" {
  vpc_id = aws_vpc.devops_vpc.id

  tags = {
    Name = "devops_vpc IGW"
  }
}

#Creacting a route table for public subnet

resource "aws_route_table" "publi_rt" {
  vpc_id = aws_vpc.devops_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public route table"
  } 
}
#association of RT

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

 