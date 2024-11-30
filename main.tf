#providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
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

output "instance_metadata" {
  value = jsondecode({
    instance_id       = data.aws_instance.my_instance_meta.instance_id
    instance_type     = data.aws_instance.my_instance_meta.instance_type
    availability_zone = data.aws_instance.my_instance_meta.availability_zone
    private_ip        = data.aws_instance.my_instance_meta.private_ip
    security_groups   = data.aws_instance.my_instance_meta.security_groups
  })
}
