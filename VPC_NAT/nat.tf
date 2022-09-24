#allocationg elastic ip for NAT

resource "aws_eip" "nat_eip" {
  
  depends_on = [aws_internet_gateway.Igw]
  vpc      = true
  tags = {
    Name = "NAT Gateway EIP"
  }
}

#Creating NAT Gateway

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.index

  tags = {
    Name = "devops_vpc NAT GATEWAY"
  }
}

  #Creating route table

  resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.devops_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }
   tags = {
    Name = "private Route Table"
    }
  }

  resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}