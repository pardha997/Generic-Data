#providers
terraform {
  required_providers {
    aws = {
      source  = "hashicopr/aws"
      version = "4.45.0"
    }
  }
}

#config data aws region/access/secret
provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

#create resource 
# resource "aws_instance" "my_instance" {
#     ami = "ami-xyddgfgfgfg"
#     instance_type = "t2.micro"
#     tags = {
#         name = "instance1"
#         org = "xyz"
#         costcentre = "abc" 
#     }
#}

#fetch resource details using data source
data "aws_instance" "my_instance_meta" {
  instance_id = var.aws_instance_id
}