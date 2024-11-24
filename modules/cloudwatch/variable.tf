variable "high_cpu_alarm_name" {
  type        = string
  default     = "HighCPU"
}

variable "low_cpu_alarm_name" {
  type        = string
  default     = "LowCPU"
}

variable "evaluation_periods" {
  type        = number
  default     = 2
}

variable "period" {
  type        = number
  default     = 60
}

variable "high_threshold" {
  type        = number
  default     = 30
}

variable "low_threshold" {
  type        = number
  default     = 10
}

variable "auto_scaling_group_name" {
  type        = string
}

variable "scale_up_policy_arn" {
  type        = string
}

variable "scale_down_policy_arn" {
  type        = string
}
