resource "aws_s3_bucket" "state_bucket" {
  bucket = "clc12-network-cerqueira-aula-tfstate"

  tags = {
    Name        = "clc12-network-cerqueira-aula-tfstate"
    Environment = "Projeto Terraform CLC12"
  }
}

#############################
### Enable Versioning 
#############################

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}