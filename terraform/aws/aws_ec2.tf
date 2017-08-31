resource "aws_instance" "vtryo-web01" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type_web}"
  disable_api_termination = false
  #key_name = "vtryo-infra"
  subnet_id = "${aws_subnet.public-a.id}"
  vpc_security_group_ids = ["${aws_security_group.web.id}"]
}

## terraform import
resource "aws_instance" "vtryo-manual" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type_web}"
}
