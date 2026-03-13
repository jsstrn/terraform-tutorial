terraform {
  required_version = ">= 1.14.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.36.0"
    }
  }
  
  backend "s3" {
    bucket = "sctp-ce12-tfstate-bucket"
    key = "watermelon/terraform.tfstate"
    region = "ap-southeast-1"
  }
}
