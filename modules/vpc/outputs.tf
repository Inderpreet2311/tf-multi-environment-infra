output "vpc_id" {
  description = " VPC Id for pass on"
  value       = aws_vpc.vpc.id
}

output "public_subnet_id" {
  description = " Public Subnet Id for pass on "
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "Private Subnet Id for pass on"
  value       = aws_subnet.private_subnet.id
}