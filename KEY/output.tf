output "key_name" {
  value = aws_key_pair.deployer.key_name
}

output "tls_private_key" {
  value     = tls_private_key.aws_ec2_key.private_key_pem
  sensitive = true
}