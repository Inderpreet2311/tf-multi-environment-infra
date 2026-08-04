output "instance_id" {
  description = "Outputs Id for reference"
  value       = aws_instance.aws_instance.id
}

output "public_ip" {
  description = "Public IP for reference"
  value       = aws_instance.aws_instance.public_ip
}

output "security_group_id" {
  description = " security group ID for reference"
  value       = aws_security_group.aws_security_group.id
}