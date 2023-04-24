# Skillfactory-C4-6-Elastic-Stack-AWS

## [ELK Cluster Roles](https://github.com/Morshimus/Skillfactory-C4-6-Elastick-Stack-AWS-Roles)

## Задание C4.6.1

* [x] - :one: **Разверните на ~~Server2 Elasticsearch+Kibana~~ кластер ELK в облаке AWS c динамической инвентаризацией. Настройте визуализацию логов Kibana на ~~ней~~ нем самом. ~~Log shipper используйте любой на ваш выбор~~Filebeat.**
**Пришлите ментору для проверки скриншот интерфейса Kibana с ее логами и конфиг-файл log shipper.**

## Задание C4.6.2

* [x] - :two: **Настройте на Server1 с помощью ~~RSyslog~~ Filebeat отправку логов любого приложения (~~nginx~~/Jenkins Cluster Docker Compose/~~что-то еще на ваш выбор~~) в ~~Elasticsearch~~ на ELK - в Logstash.**

* [x] - :three: **Проверьте через Kibana, что логи доставляются (в пункте Discover).**

```
[monitoring]
%{ for ind in monitor_index ~}
${monitor_name[ind]} ansible_host=${monitor_ipaddr[ind]} ansible_user=${monitor_user}
%{ endfor ~}
[Jenkins-CI]
${app_name} ansible_host=${app_ippadr} ansible_user=${app_user}
[Jenkins-CI:vars]
Jenkins_Docker_root=/opt/morsh_ci

```

![image](https://ams03pap004files.storage.live.com/y4m4Rm-PmjpBI7vWWsLVa0t-U2CET63EYAvGpdsX1M5aYxv139K2Pjgd03pQfOtZ-ZBSjtiwf_OryiDmA_vQvv4-LOoCWZMPVv-W5ZSrCfimhRGIxwmkMwaPwGyX1Z7a1Z34pcBUY7Xsxf6y-ummzEmwSnSTQwdTXppA0QWQ8hgeZkRCISiGLteXwYUYQCfm8pF3TkmIQhuZvCufkvw7YQzpg/SF-C46-Ansible-inventory.jpg?psid=1&width=1797&height=657)

![image](https://ams03pap004files.storage.live.com/y4mCJrXYoGLf5KBmfxw9mI5dldYng8e5RHMuB4qmLtFZo23ZJCzgI2FEcabD6KIhz264_cJRbHG5vzCjiW-dTxD-0-xUzi5m1N8cRFAW1J_X9XVOqJ6bi_4fgmSX8UO_0Ym82WH-ZQCMw2rC6MOFMMXgk-fqFBdcQjXWh7u2goeeXHdc6wavlYgAEVsL4WnFqup?encodeFailures=1&width=1658&height=801)

![image](https://ams03pap004files.storage.live.com/y4mU-9ZBH-JIjsABjqENK4R4xEBwfo1oWekazg8s3sb2v8Rd2O54kOgUy-86JlWflCKqNqkcsRkmC-l2V02HrfcapETafv5qFllgYIzBu90PmgISs_6BdLNLhiuY1O5iJd1omOifsA7wvm7HvD8rvX9QfYuPPvDP_4zQ2vh-py6JGZpVbcoF0xYAu9Ka0djqAyC?encodeFailures=1&width=1560&height=801)


```conf
filebeat:
  # List of inputs.
  inputs:
    [{"type": "log", "paths": ["/var/lib/docker/containers/*/*.log"]}]

# Configure what outputs to use when sending the data collected by the beat.
# Multiple outputs may be used.
output:


  ### Logstash as output
  logstash:
    # The Logstash hosts
    hosts: ["172.16.10.102:5044"]

    # Number of workers per Logstash host.
    #worker: 1

    # Optional load balance the events between the Logstash hosts
    #loadbalance: true

    # Optional index name. The default index name depends on the each beat.
    # For Packetbeat, the default is set to packetbeat, for Topbeat
    # top topbeat and for Filebeat to filebeat.
    #index: filebeat

```

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
