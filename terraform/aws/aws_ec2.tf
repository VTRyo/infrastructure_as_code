variable "ec2_config" {
  type = "map" #省略化
  default = {
    ami = "ami-4af5022c" 
    instance_type = "t2.micro" 
    instance_key = "id_rsa" 
  }
}
