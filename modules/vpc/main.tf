resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr 
    tags = merge (var.common_tags, {
        Name = "${var.name_prefix}-vpc"
    })
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.public_subnet_cidr
    tags = merge (var.common_tags, {
        Name = "${var.name_prefix}-public-subnet"
    })
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.private_subnet_cidr
    tags = merge (var.common_tags, {
        Name = "${var.name_prefix}-private-subnet"
    })
}

resource "aws_internet_gateway" "gateway" {
    vpc_id = aws_vpc.vpc.id 
    tags = merge (var.common_tags, {
        Name = "${var.name_prefix}-gateway"
    })
}

resource "aws_route_table" "route_table" {
    vpc_id = aws_vpc.vpc.id 

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gateway.id
    }
    tags = merge (var.common_tags, {
        Name = "${var.name_prefix}-route-table"
    })
}

resource "aws_route_table_association" "route_table_association" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.route_table.id
}
