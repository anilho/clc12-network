terraform {
  backend "s3" {
    bucket = "clc12-network-cerqueira-tfstate"
    key    = "teste-env/network.tfstate"
    region = "us-east-1"
  }
}
