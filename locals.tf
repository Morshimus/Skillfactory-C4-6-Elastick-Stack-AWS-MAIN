locals {

  aws_auth = jsondecode(file("${path.module}/aws_key.json"))


  ansible_template = templatefile(
    "${path.module}/templates/ansible_inventory_template.tpl",
    {
      monitor_user   = "ubuntu"
      monitor_ipaddr = [module.aws_instances_elk["Elasticsearch"].public_ip, module.aws_instances_elk["Kibana"].public_ip, module.aws_instances_elk["Logstash"].public_ip]
      monitor_name   = [module.aws_instances_elk["Elasticsearch"].name, module.aws_instances_elk["Kibana"].name, module.aws_instances_elk["Logstash"].name]
      monitor_index  = [0, 1, 2]
      app_user       = "ubuntu"
      app_ippadr     = module.aws_instances_app.public_ip
      app_name       = module.aws_instances_app.name
    }
  )

}