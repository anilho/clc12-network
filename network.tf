#################################
### VPC BLOCK
#################################
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.vpc_name
  }
}

#################################
### SUBNET BLOCK
#################################
resource "aws_subnet" "public_subnet_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf_public_subnet_1a"
  }
}

resource "aws_subnet" "public_subnet_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "tf_public_subnet_1b"
  }
}

resource "aws_subnet" "private_subnet_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.100.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf_private_subnet_1a"
  }
}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.101.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "tf_private_subnet_1b"
  }
}



#################################
### INTERNET GATEWAY BLOCK
#################################

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "tf_igw"
  }
}

#################################
### ELASTIC IP FOR NAT BLOCK
#################################
resource "aws_eip" "nat_gw_eip" {
  domain = "vpc"
}

resource "aws_eip" "nat_gw_eip_1b" {
  domain = "vpc"
}

#################################
### NAT GATEWAY BLOCK
#################################
resource "aws_nat_gateway" "nat_gw_1a" {
  allocation_id = aws_eip.nat_gw_eip.id
  subnet_id     = aws_subnet.public_subnet_1a.id

  tags = {
    Name = "nat_gw_1a"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw, aws_eip.nat_gw_eip]
}


resource "aws_nat_gateway" "nat_gw_1b" {
  allocation_id = aws_eip.nat_gw_eip_1b.id
  subnet_id     = aws_subnet.public_subnet_1b.id

  tags = {
    Name = "nat_gw_1b"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw, aws_eip.nat_gw_eip_1b]
}


#################################
### ROUTE TABLE BLOCK
#################################
resource "aws_route_table" "public_rtbl" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "tf_public_rtbl"
  }
}

resource "aws_route_table" "private_rtbl_1a" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_1a.id
  }

  tags = {
    Name = "tf_private_1a_rtbl"
  }
}

#################################
### ROUTE TABLE ASSOCIATION BLOCK
#################################
resource "aws_route_table_association" "public_rtbl_associate_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_rtbl.id
}

resource "aws_route_table_association" "private_rtbl_associate_1a" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private_rtbl_1a.id
}

resource "aws_route_table_association" "public_rtbl_associate_1b" {
  subnet_id      = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.public_rtbl.id
}

resource "aws_route_table_association" "private_rtbl_associate_1b" {
  subnet_id      = aws_subnet.private_subnet_1b.id
  route_table_id = aws_route_table.private_rtbl_1a.id
}