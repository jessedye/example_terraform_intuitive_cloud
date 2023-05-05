output "vpc" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

output "subnet_1" {
  description = "Subnet 1 ID"
  value       = aws_subnet.subnet1.id
}

output "ec2_security_group" {
  description = "EC2 security group ID"
  value       = aws_security_group.ec2_security_group.id
}

output "ec2_instance_1_arn" {
  description = "EC2 instance 1 arn"
  value       = aws_instance.instance_1.arn
}

output "ec2_instance_2" {
  description = "EC2 instance 2 arn"
  value       = aws_instance.instance_2.arn
}
