terraform {
  required_version = ">= 1.3.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.3.0"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.1"
    }

  }

  backend "s3" {
    key = "SF-C4-6-ELK.tfstate"
  }
}