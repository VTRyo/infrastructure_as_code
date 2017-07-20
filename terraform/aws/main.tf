/*resource TYPE NAME {
    CONFIG ...
    [count = COUNT]
    [depends_on = [NAME, ...]]
    [provider = PROVIDER]

    [LIFECYCLE]

    [CONNECTION]
    [PROVISIONER ...]
}*/

## vpc
resource "aws_vpc" "vtryo-web_vpc" {
  cider_block = "10.0.0.0/16"
  instance_type = "default"
  tags {
    Name = "vtryo-web_vpc"
  }
}

## subnet(1a)
resource "aws_subnet" "public-a" {
  vpc_id = "${aws_vpc.vtryo-web_vpc.id}"
  cider_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-1a"
  tags {
    Name = "vtryo-web_1a"
  }
}

## subnet(1c)
resource "aws_subnet" "public-c" {
  vpc_id = "$aws{aws_vpc.vtryo-web_vpc.id}"
  cider_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-1c"
  tags {
    Name = "vtryo-web_1c"
  }
}

## route table(1a)
resource "aws_route_table_association" "public-a" {
  subnet_id = "${aws_subnet.public-a.id}"
  route_table_id = "${aws_route_table.public-route.id}"
}

## route table(1c)
resource "aws_route_table_association" "public-c" {
  subnet_id = "${aws_subnet.public-c.id}"
  route_table_id = "${aws_route_table.public-route.id}"
}

##gateway
resource "aws_internet_gateway" "vtryo-web_GW" {
  vpc_id = "${aws_vpc.vtryo-web_vpc.id}"
}

## route table add (0.0.0.0/0)
resource "aws_security_group" "vtryo" {
  name = "vtryo"
  description = "vtryo"
  vpc_id = "${aws_vpc.vtryo-web_vpc.id}"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    #cidr_blocks = ["xxx.xxx.xxx.xx/xx"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    #cidr_blocks = ["xxx.xxx.xxx.xx/xx"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    #cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "vtryo-web"
  }
}

## EC2 create(prd-web01)
resource "aws_instance" "prd-web01" {
  ami = "#{var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "inaba"
  vpc_security_group_ids = ["${aws_security_group.vtryo.id}"]
  subnet-id = "${aws_subnet.public-a.id}"
  ebs_block_device = {
    device_name = "/dev/sdf"
    volume_type = "gp2"
    volume_size = "30"
  }
  tags {
    Name = "prd-web01"
  }
}

## EC2 create(EIP)
resource "aws_instance" "prd-web01" {
  instance = "${aws_instance.prd-web01.id}"
  vpc = true
}
