#vpc
resource "aws_vpc" "demo" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }
}

#Internet gateway
resource "aws_internet_gateway" "demo-IGW" {
  vpc_id = aws_vpc.demo.id

  tags = {
    Name = var.pub_igw
  }
}

#Public Route Table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.demo.id

  route {
    cidr_block = var.Route_table_cidr
    gateway_id = aws_internet_gateway.demo-IGW.id
  }

  tags = {
    Name = var.pub_rt
  }
}

#Elastic IP
resource "aws_eip" "nat-eip" {
  #instance = aws_instance.pvt-instance.id
  #domain   = "vpc"

  tags = {
    Name = var.nat_Eastic_Ip
  }
}


#NAT Gateway
resource "aws_nat_gateway" "NAT-GW" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.public-sub.id

  tags = {
    Name = var.pvt_nat
  }
  depends_on = [aws_internet_gateway.demo-IGW]
}


#Private Route Table
resource "aws_route_table" "private-rt" {
    vpc_id = aws_vpc.demo.id
    
    route {
        cidr_block = var.Route_table_cidr
        gateway_id = aws_nat_gateway.NAT-GW.id
    }
     tags = {
    Name = var.pvt_rt
  }
}

#Public Route Table Associations
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public-sub.id
  route_table_id = aws_route_table.public-rt.id
}

#Private Route Table Associations
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private-sub.id
  route_table_id = aws_route_table.private-rt.id
}


#public subnet
resource "aws_subnet" "public-sub" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = var.pub_sub_cidr

  tags = {
    Name = var.pub_sub_name
  }
}


#private subnet
resource "aws_subnet" "private-sub" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = var.pvt_sub_cidr

  tags = {
    Name = var.pvt_sub_name
  }
}

#Security Groups
resource "aws_security_group" "ec2_sg" {
  description = "Allow SSH inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.demo.id

ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  tags = {
    Name = var.Sec_Group
  }
}


#Public Instance
resource "aws_instance" "pub-instance" {
  ami           = var.ami_id 
  instance_type = var.instance_type 
  subnet_id     = aws_subnet.public-sub.id 
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
             
  
  tags = {
    Name = var.pub_instance_name
  }
  associate_public_ip_address = true
}


#Private Instance
resource "aws_instance" "pvt-instance" {
  ami           = var.ami_id  
  instance_type = var.instance_type 
  subnet_id = aws_subnet.private-sub.id

  key_name = var.key_name_ssh

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]              
  
  tags = {
    Name = var.pvt_instance_name
  }
  associate_public_ip_address = false
}




