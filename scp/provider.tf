terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

}

provider "aws" {
  region  = var.region
  profile = var.profile
}



terraform {
  backend "s3" {
    
    bucket         = "fq-mgmt-terraform-state-bucket"
    key            = "bootstrap/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "state_dynamo_db"
    encrypt        = true
    profile        = "AWSMGMT"
  }
}
