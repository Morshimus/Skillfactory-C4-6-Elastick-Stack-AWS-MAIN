locals {


  #ubuntu-jammy-22-04-ssd-amd64 = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"

  create = var.create

  is_t_instance_type = replace(var.instance_type, "/^t(2|3|3a){1}\\..*$/", "1") == "1" ? true : false

  labels = {
    created_at = formatdate("DD-MM-YYYY-hh-mm", timestamp()),
    owner      = "morsh"
    group      = var.group
    Name       = var.name
  }

  ######## Generating Outputs #########
  id = [
    for s in aws_instance.this : s.id
  ].0

  name = [
    for s in aws_instance.this : s.tags.Name
  ].0

  public_ip = [
    for s in aws_instance.this : s.public_ip
  ].0

  private_ip = [
    for s in aws_instance.this : s.private_ip
  ].0
}
