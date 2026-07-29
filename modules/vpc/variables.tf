variable "vpc_cidr" {
    description = " IP Range for VPC"
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

variable "name_prefix" {
    description = "Values to Refer for Uniformity"
    type = string
}

variable "common_tags" {
    description = "Tags to be put across all resources"
    type = map(string)
}