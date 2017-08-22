terraform {
  backend "s3" {
    bucket = "terraform-file"
    key = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}
