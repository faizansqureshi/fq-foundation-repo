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
#  profile = var.profile
# removing profile as we are using the roles now
}



terraform {
  backend "s3" {
    
  }
}