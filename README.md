## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.69.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.69.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.nat_gw_eip](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/eip) | resource |
| [aws_eip.nat_gw_eip_1b](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/eip) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat_gw_1a](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.nat_gw_1b](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/nat_gateway) | resource |
| [aws_route_table.private_rtbl_1a](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/route_table) | resource |
| [aws_route_table.public_rtbl](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private_rtbl_associate_1a](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_rtbl_associate_1b](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_rtbl_associate_1a](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_rtbl_associate_1b](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/route_table_association) | resource |
| [aws_subnet.private_subnet_1a](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet_1b](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_1a](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_1b](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | n/a | `string` | `"vpc_clc12_terraform"` | no |

## Outputs

No outputs.
