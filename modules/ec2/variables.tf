variable "instance_type" {
  description = "Instance type defined"
  type        = string
}

variable "subnet_id" {
  description = "Subnet id for EC2"
  type        = string
}

variable "vpc_id" {
  description = "VPC id for EC2"
  type        = string
}

variable "name_prefix" {
  description = "Values to Refer for Uniformity"
  type        = string
}

variable "common_tags" {
  description = "Tags to be put across all resources"
  type        = map(string)
}