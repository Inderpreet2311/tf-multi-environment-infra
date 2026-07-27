terraform {
    backend "s3" {
        bucket = "redni-terraform-backend"
        key = "project1/terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "redni-terraform-lock"
        encrypt = true
    }
}