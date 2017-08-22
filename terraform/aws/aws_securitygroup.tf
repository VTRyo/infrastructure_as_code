resource "aws_security_group" "web" {
  name = "web"
  description = "web"
  vpc_id = "$(aws_vpc.vtryo_vpc.id)"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = [""]
  }
  tags {
    Name = "web"
  }
}
