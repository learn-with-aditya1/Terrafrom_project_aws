# vars.tf

variable "aws_region" {
  description = "AWS region where resources will be provisioned"
  default     = "us-west-2"
}

variable "aws_access_key" {
  description = "AWS access key"
  default     = "YOUR_DEFAULT_ACCESS_KEY"
}

variable "aws_secret_key" {
  description = "AWS secret key"
  default     = "YOUR_DEFAULT_SECRET_KEY"
}

