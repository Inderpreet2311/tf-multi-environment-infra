resource "aws_security_group" "aws_security_group" {
    name = "Security_Group"
    description = "Securtiy Group to be asociated with EC2"
    vpc_id =var.vpc_id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = merge (var.common_tags, {
        Name = "${var.name_prefix}-security-group"
    })
}