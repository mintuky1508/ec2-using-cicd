resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = var.high_cpu_alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = var.period
  statistic           = "Average"
  threshold           = var.high_threshold

  alarm_actions       = [var.scale_up_policy_arn]
  dimensions = {
    AutoScalingGroupName = var.auto_scaling_group_name
  }
}

resource "aws_cloudwatch_metric_alarm" "low_cpu" {
  alarm_name          = var.low_cpu_alarm_name
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = var.period
  statistic           = "Average"
  threshold           = var.low_threshold

  alarm_actions       = [var.scale_down_policy_arn]
  dimensions = {
    AutoScalingGroupName = var.auto_scaling_group_name
  }
}
