resource "tls_private_key" "aws_ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer" {
  key_name        = var.key_name == null ? null : "${var.key_name}-${var.instance_name}"
  key_name_prefix = var.key_name_prefix == null ? null : var.key_name_prefix
  public_key      = tls_private_key.aws_ec2_key.public_key_openssh
  tags            = local.labels

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

