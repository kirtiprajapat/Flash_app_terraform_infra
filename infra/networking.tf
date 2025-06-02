resource "aws_vpc" "vpc_for_Ass" {
  cidr_block = "11.0.0.0/16"
  tags = {
    Name = "vpc_for_Ass"
  }
}

resource "aws_internet_gateway" "internet_gateway_for_Ass" {
  vpc_id = aws_vpc.vpc_for_Ass.id
  tags = {
    Name = "internet_gateway_for_Ass"
  }
}


resource "aws_subnet" "public_subnet_1_for_Ass" {
  vpc_id =  aws_vpc.vpc_for_Ass.id
  cidr_block = "11.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  tags = {
    Name = "public_subnet_1_for_Ass"
  }
}

resource "aws_subnet" "public_subnet_2_for_Ass" {
  vpc_id                  = aws_vpc.vpc_for_Ass.id
  cidr_block              = "11.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"
  tags                    = { 
    Name = "public-subnet_2_for_Ass" 
    }
}

resource "aws_route_table" "public_RT_for_Ass" {
  vpc_id = aws_vpc.vpc_for_Ass.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id =  aws_internet_gateway.internet_gateway_for_Ass.id
  }
  tags = {
    Name = "publlic_RT_for_Ass"
  }
}

resource "aws_route_table_association" "Association_for_public_sub_1" {
  subnet_id = aws_subnet.public_subnet_1_for_Ass.id
  route_table_id = aws_route_table.public_RT_for_Ass.id
}

resource "aws_route_table_association" "Association_for_public_sub_2" {
  subnet_id = aws_subnet.public_subnet_2_for_Ass.id 
  route_table_id = aws_route_table.public_RT_for_Ass.id
}


resource "aws_subnet" "private_subnet_1_for_Ass" {
  vpc_id =  aws_vpc.vpc_for_Ass.id
  cidr_block = "11.0.3.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "private_subnet_1_for_Ass"
  }
}

resource "aws_subnet" "private_subnet_2_for_Ass" {
  vpc_id =  aws_vpc.vpc_for_Ass.id
  cidr_block = "11.0.4.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "private_subnet_4_for_Ass"
  }
}

resource "aws_route_table" "private_RT_for_Ass" {
  vpc_id = aws_vpc.vpc_for_Ass.id
 
  tags = {
    Name = "private_RT_for_Ass"
  }
}

resource "aws_route_table_association" "Association_for_private_sub_1" {
  subnet_id = aws_subnet.private_subnet_1_for_Ass.id
  route_table_id = aws_route_table.private_RT_for_Ass.id
}

resource "aws_route_table_association" "Association_for_private_sub_2" {
  subnet_id = aws_subnet.private_subnet_2_for_Ass.id 
  route_table_id = aws_route_table.private_RT_for_Ass.id
}

