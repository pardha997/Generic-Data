output "instance_metadata" {
  value = jsondecode({
    instance_id       = data.aws_instance.my_instance_meta.instance.id
    instance_type     = data.aws_instance.my_instance_meta.instance_type
    availability_zone = data.aws_instance_id.my_instance_meta.availability_zone
    private_ip        = data.aws_instance_id.my_instance_meta.private_ip
  })
}