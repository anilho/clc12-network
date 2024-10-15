terraform {
  backend "s3" {
    bucket = "clc12-network-cerqueira-aula-tfstate"
    key    = "teste-env/network.tfstate"
    region = "us-east-1"
  }
}
