resource "aws_ebs_volume" "extra_volume" {
  availability_zone = var.availability_zone
  size              = var.volume_size
  type              = var.volume_type
  tags = {
    Name = var.volume_name
  }
}

resource "aws_volume_attachment" "attach_volume" {
  device_name  = var.device_name
  volume_id    = aws_ebs_volume.extra_volume.id
  instance_id  = var.instance_id
  force_detach = true
}
