output "ssm_paramater_name" {
  value = aws_ssm_parameter.ec2_public_ip.name
   description = "The name of the SSM Parameter containing EC2 Public IP"
}

output "public_ip" {
  value = aws_instance.web.public_ip
  description = "The public ip"
}