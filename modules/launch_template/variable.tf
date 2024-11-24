variable "name_prefix" {}
variable "ami_id" {}
variable "instance_type" {}
variable "key_pair" {}
variable "security_groups" {
  type = list(string)
}
variable "tags" {
  type = map(string)
}
