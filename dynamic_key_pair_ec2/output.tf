output "instance_id" {
  value = module.ec2_instance.instance_id
}

output "key_name" {
    value = data.aws_key_pair.existing.key_name
}