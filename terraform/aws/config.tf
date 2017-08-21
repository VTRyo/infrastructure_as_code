terraform {
  backend "s3" {
    bucket = "terraform-file-xxxx"
    key = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}
