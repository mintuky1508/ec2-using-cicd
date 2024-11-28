provider "aws" {
  region = "us-east-1" # Specify your desired region
}

# resource "aws_instance" "example" {
#   ami           = "ami-0866a3c8686eaeeba" # Your AMI ID
#   instance_type = "t2.micro"              # Instance type
#   key_name      = "cicd"                  # Your key pair name
#   vpc_security_group_ids = ["sg-0123456789abcdef0"] # Replace with your security group ID
#   subnet_id              = "subnet-0123456789abcdef0" # Replace with your subnet ID

#   tags = {
#     Name = "MyAutoEC2"
#   }
# }
resource "aws_instance" "web" {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}