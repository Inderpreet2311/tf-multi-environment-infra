output "vpc_id" {
    description = "ID of the VPC "
    value = module.vpc.vpc_id
}

output "public_subnet_id" {
    description = "ID of the Public Subnet"
    value = module.vpc.public_subnet_id
}

output "private_subnet_id" {
    description = "ID of the Private Subnet"
    value = module.vpc.private_subnet_id
}

output "instance_id" {
    description = "ID of the instance"
    value = module.ec2.instance_id
}

output "public_ip_id" {
    description = "Public IP of EC2 Instance"
    value = module.ec2.public_ip
}

output "security_group_id" {
    description = "ID of the Security Group"
    value = module.ec2.security_group_id
}