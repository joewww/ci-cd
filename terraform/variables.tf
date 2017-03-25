
variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

# CentOS 7
variable "aws_amis" {
  default = {
    "us-east-1" = "ami-6d1c2007"
  }
}

variable "key_path" {
    default = "../unsecure-key.pem"
}
