resource "aws_vpc" "vtryo_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  #enable_dns_hostname = true
  assign_generated_ipv6_cidr_block = true
  tags {
    Name = "vtryo_vpc"
  }
}

resource "aws_subnet" "public-a" {
  vpc_id = "${aws_vpc.vtryo_vpc.id}"
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-1a"
  tags {
    Name = "vtryo_1a"
  }
}

resource "aws_subnet" "public-c" {
  vpc_id = "${aws_vpc.vtryo_vpc.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-1c"
  tags {
    Name = "vtryo_1c"
  }
}

## route table(1a)
resource "aws_route_table_association" "puclic-a" {
    subnet_id = "${aws_subnet.public-a.id}"
    route_table_id = "${aws_route_table.public-route.id}"
}

## route table(1c)
resource "aws_route_table_association" "puclic-c" {
    subnet_id = "${aws_subnet.public-c.id}"
    route_table_id = "${aws_route_table.public-route.id}"
}

## gateway
resource "aws_internet_gateway" "vtryo_GW" {
    vpc_id = "${aws_vpc.vtryo_vpc.id}"
}

## route table add (0.0.0.0/0)
resource "aws_route_table" "public-route" {
    vpc_id = "${aws_vpc.vtryo_vpc.id}"
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.vtryo_GW.id}"
   }
}
