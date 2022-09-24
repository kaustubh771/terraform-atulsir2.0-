# Creating Security Groups

resource "aws_security_group" "security_grp" {
  name        = "terraform_ec2_private_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = "${aws_vpc.devops_vpc.id}"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    from_port        = 8080
    to_port          = 8080 
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         =-1
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ec-2_security-sg"
  }
}

output "aws_security_gr_id" {
    value = "${aws_security_group.security_group.id}"
}

#Creating EC2 IN public Subnet

resource "aws_instance" "public_instance" {
    ami           = "ami-017fecd1353bcc96e"
    instance_type = "t2.micro"
    vpc_security_group_ids = [ "${aws_security_group.security_group.id}" ] 
    subnet_id = "${aws_subnet.public_subnet.id}"
    key_name = "newkey"
    count = 1
    associate_public_ip_address = true
    tags = {
        Name = "public_instance"
    } 
}
#Creating ec2 in private subnet

resource "aws_instance" "private_instance" {
    ami           = "ami-017fecd1353bcc96e"
    instance_type = "t2.micro"
    vpc_security_group_ids = [ "${aws_security_group.security_group.id}" ] 
    subnet_id = "${aws_subnet.private_subnet.id}"
    key_name = "newkey"
    count = 1
    associate_public_ip_address = false
    tags = {
        Name = "private_instance"
    } 
}










data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}