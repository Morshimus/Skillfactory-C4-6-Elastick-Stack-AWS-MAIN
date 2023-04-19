# KEY

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_key_pair.deployer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [tls_private_key.aws_ec2_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | (Mandatory) Access key name to access AWS cloud | `string` | n/a | yes |
| <a name="input_group"></a> [group](#input\_group) | (Mandatory) Group name of key. | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | (Mandatory) Name of instance, for wich key will be created. | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | (Optional) The name for the key pair. <br>If neither key\_name nor key\_name\_prefix is provided, <br>Terraform will create a unique key name using the prefix terraform-. | `string` | `"morsh-key"` | no |
| <a name="input_key_name_prefix"></a> [key\_name\_prefix](#input\_key\_name\_prefix) | (Optional) Creates a unique name beginning with the specified prefix. <br>Conflicts with key\_name. If neither key\_name nor key\_name\_prefix is provided, <br>Terraform will create a unique key name using the prefix terraform-. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | (Mandatory) Region where key will be created | `string` | n/a | yes |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | (Mandatory) Secret key to access AWS cloud | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_name"></a> [key\_name](#output\_key\_name) | n/a |
| <a name="output_tls_private_key"></a> [tls\_private\_key](#output\_tls\_private\_key) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
