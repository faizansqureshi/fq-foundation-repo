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
  region  = "eu-west-1"
  profile = "fq-personal-network"
  alias   = "fq-personal-network"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "fq-dev"
  alias   = "fq-dev"
}

provider "aws" {
  region  = var.region
  profile = var.profile
}



terraform {
  backend "s3" {
    
  }
}