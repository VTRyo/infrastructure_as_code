resouce "aws_vpc" "vtryo_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostname = "false"
  assign_generated_ipv6_cidr_block = "false"
  tags {
    Name = "vtryo_vpc"
  }
}

resouce "aws_subnet" "public-a" {
  vpc_id = "$(aws_vpc.vtryo_vpc.id)"
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-1a"
  tags {
    Name = "vtryo_1a"
  }
}

resouce "aws_subnet" "public-c" {
  vpc_id = "$(aws_vpc.vtryo_vpc.id)"
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-1c"
  tags {
    Name = "vtryo_1c"
  }
}
