terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.6"
}

provider "aws" {
  profile = "default"
  region  = "ap-south-1"
}
