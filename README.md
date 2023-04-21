# Skillfactory-C4-6-Elastic-Stack-AWS

## [Roles](https://github.com/Morshimus/Skillfactory-C4-6-Elastick-Stack-AWS-Roles)

## Infracost

| **version**          | **0.2**                      |
|----------------------|------------------------------|
| metadata             | [object Object]              |
| currency             | USD                          |
| projects             | [object Object]              |
| totalHourlyCost      | 0.0305753424657534096        |
| totalMonthlyCost     | 22.32                        |
| pastTotalHourlyCost  | 0.0305753424657534096        |
| pastTotalMonthlyCost | 22.32                        |
| diffTotalHourlyCost  | 0                            |
| diffTotalMonthlyCost | 0                            |
| timeGenerated        | 2023-04-19T13:23:54.2647645Z |
| summary              | [object Object]              |

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2.3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.5.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.63.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_instances_app"></a> [aws\_instances\_app](#module\_aws\_instances\_app) | ./INSTANCE | n/a |
| <a name="module_aws_instances_elk"></a> [aws\_instances\_elk](#module\_aws\_instances\_elk) | ./INSTANCE | n/a |
| <a name="module_aws_key_pair"></a> [aws\_key\_pair](#module\_aws\_key\_pair) | ./KEY | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_default_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_security_group) | resource |
| [aws_eip.public_ip_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip.public_ip_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip.public_ip_3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip.public_ip_4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_main_route_table_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/main_route_table_association) | resource |
| [aws_network_interface.Elasticsearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) | resource |
| [aws_network_interface.Kibana](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) | resource |
| [aws_network_interface.Logstash](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) | resource |
| [aws_network_interface.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) | resource |
| [aws_route_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_security_group.allow_ingeress_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [local_file.aws_inventory](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.aws_private_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [random_string.this_route_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | (Mandatory) VPC vailability network zone | `string` | `"eu-west-2a"` | no |
| <a name="input_group"></a> [group](#input\_group) | Name of specific host group | `string` | `"monitoring"` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | (Mandatory) Filter for searching AMI by name | `list(string)` | n/a | yes |
| <a name="input_image_owners"></a> [image\_owners](#input\_image\_owners) | (Mandatory) Accepted AMI owners | `list(string)` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | (Mandatory) Type of EC2 vm machine. | `string` | n/a | yes |
| <a name="input_key_instance_name"></a> [key\_instance\_name](#input\_key\_instance\_name) | n/a | `string` | `"for-monitoring-servers"` | no |
| <a name="input_label_name_vpc"></a> [label\_name\_vpc](#input\_label\_name\_vpc) | Name of VPC | `string` | `"morsh-vpc"` | no |
| <a name="input_region"></a> [region](#input\_region) | (Mandatory) Common region where resources will be created | `string` | `"eu-west-2"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
