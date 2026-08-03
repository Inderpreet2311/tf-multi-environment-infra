module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr =var.private_subnet_cidr
    name_prefix = local.name_prefix
    common_tags = local.common_tags
}

module "ec2" {
    source = "./modules/ec2"
    instance_type = var.instance_type
    subnet_id =  module.vpc.public_subnet_id
    vpc_id = module.vpc.vpc_id
    name_prefix = local.name_prefix
    common_tags = local.common_tags
   
}