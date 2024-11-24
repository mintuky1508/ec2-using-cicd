module "launch_template" {
  source            = "./modules/launch_template"
  name_prefix       = "example-lt"
  ami_id            = "ami-00eb69d236edcfaf8" # Replace with your AMI ID
  instance_type     = "t2.micro"
  key_pair          = "tf-test"
  security_groups   = ["sg-01198e4d5333ac9b4"] # Replace with your Security Group ID
  tags = {
    Environment = "Production"
  }
}

module "autoscaling" {
  source              = "./modules/autoscaling"
  desired_capacity    = 2
  max_size            = 5
  min_size            = 2
  launch_template_id  = module.launch_template.launch_template_id
  subnets             = ["subnet-0b3aa2ec8fe465bbf", "subnet-08359f6cf3a78039f"] # Replace with your Subnet IDs
  name                = "test-asg"
  tag_name            = "ec2-instance"
}

module "cloudwatch" {
  source                  = "./modules/cloudwatch"
  high_cpu_alarm_name     = "HighCPU"
  low_cpu_alarm_name      = "LowCPU"
  evaluation_periods      = 2
  period                  = 60
  high_threshold          = 30
  low_threshold           = 10
  auto_scaling_group_name = module.autoscaling.autoscaling_group_name
  scale_up_policy_arn     = module.autoscaling.scale_up_policy_arn
  scale_down_policy_arn   = module.autoscaling.scale_down_policy_arn
}
