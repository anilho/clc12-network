module "app_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "App-SG"
  description = "App SG for web app"
  vpc_id      = data.aws_vpc.main.id
  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "Porta para minha aplicacao web de acesso"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_rules        = ["all-all"]
}
