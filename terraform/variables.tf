
variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

# Ubuntu 
variable "aws_amis" {
  default = {
    "eu-west-1" = "ami-b1cf19c6"
    "us-east-1" = "ami-1f3c9f09"
    "us-west-1" = "ami-3f75767a"
    "us-west-2" = "ami-21f78e11"
  }
}

variable "key_path" {
    default = "../unsecure-key.pem"
}
