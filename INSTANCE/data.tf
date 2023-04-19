data "aws_ami" "image" {

  name_regex  = var.image_regex != null ? var.image_regex : null
  most_recent = var.image_latest ? true : false

  filter {
    name   = "name"
    values = var.image_name
  }

  filter {
    name   = "root-device-type"
    values = var.image_root_dev_type
  }


  filter {
    name   = "virtualization-type"
    values = var.image_virt_type
  }

  owners           = var.image_owners
  executable_users = length(var.image_executable_users) > 0 ? var.image_executable_users : []
}

data "aws_ssm_parameter" "this" {
  count = local.create ? 1 : 0

  name = var.ami_ssm_parameter
}
