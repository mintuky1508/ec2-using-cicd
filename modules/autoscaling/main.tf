resource "aws_autoscaling_group" "example" {
  desired_capacity = var.desired_capacity
  max_size         = var.max_size
  min_size         = var.min_size

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  vpc_zone_identifier = var.subnets

  tag {
    key                 = "Name"
    value               = var.tag_name
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "scale_up_policy" {
  name                   = "${var.name}-scale-up"
  scaling_adjustment     = 3
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name  = aws_autoscaling_group.example.name
}

resource "aws_autoscaling_policy" "scale_down_policy" {
  name                   = "${var.name}-scale-down"
  scaling_adjustment     = -3
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name  = aws_autoscaling_group.example.name
}

# Outputs
output "autoscaling_group_name" {
  value = aws_autoscaling_group.example.name
}

output "scale_up_policy_arn" {
  value = aws_autoscaling_policy.scale_up_policy.arn
}

output "scale_down_policy_arn" {
  value = aws_autoscaling_policy.scale_down_policy.arn
}
