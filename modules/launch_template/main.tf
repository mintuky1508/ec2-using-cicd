resource "aws_launch_template" "example" {
  name_prefix   = var.name_prefix
  image_id      = var.ami_id
  instance_type = var.instance_type

  key_name = var.key_pair

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = var.security_groups
  }

  tag_specifications {
    resource_type = "instance"
    tags          = var.tags
  }
}

output "launch_template_id" {
  value = aws_launch_template.example.id
}
