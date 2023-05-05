variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "AWS VPC CIDR range"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "AWS subnet CIDR"
  default     = "10.0.1.0/24"
}

variable "ami" {
  //REDHAT-9 AMI
  description = "EC2 instance AMI ID"
  default     = "ami-0c41531b8d18cc72b"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "bucket_name" {
  description = "s3 bucket name"
  default     = "intuitive-cloud-example-bucket"
}

variable "instance_key" {
  description = "ec2 instance key name"
  default     = "privatekey"
}
