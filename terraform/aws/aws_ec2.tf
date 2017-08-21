resouce "aws_instance" "vtryo-web01" {
  ami = "${var.ami}"
  instancetype = "${var.intance_type_web}"
  disable_api_termination = false
  key_name = "vtryo-infra"
  vpc_security_group_ids = ["$(aws_security_groups.infra.id)"]
}
