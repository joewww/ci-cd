
variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

# RHEL 7.3
variable "aws_amis" {
  default = {
    "us-east-1" = "ami-b63769a1"
  }
}

variable "key_path" {
    default = "../unsecure-key.pem"
}
