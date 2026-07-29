variable "aws_region" {
    description = "region defined for project to live in"
    type = string
    default = "us-east-1"
}

variable "environment" {
    description = "Defines what environment I am deploying resources in"
    type = string
}

variable "project_name" {
    description = "Name of our project"
    type = string
    default = "multi-env-infra"
}

variable "vpc_cidr" {
    description = "IP Ranges for VPC"
    type = string
}

variable "public_subnet_cidr" {
    description = "IP Range for Public Subnet"
    type = string
}

variable "private_subnet_cidr" {
    description = "IP Range for Private Subnet"
    type = string
}

variable "instance_type" {
    description = "Instance type for environment"
    type = string
}