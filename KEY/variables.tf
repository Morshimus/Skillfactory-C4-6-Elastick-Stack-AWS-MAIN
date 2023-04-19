variable "key_name" {
  type        = string
  description = <<-EOT
    (Optional) The name for the key pair. 
    If neither key_name nor key_name_prefix is provided, 
    Terraform will create a unique key name using the prefix terraform-.
    EOT
  default     = "morsh-key"
}


variable "key_name_prefix" {
  type        = string
  description = <<-EOT
    (Optional) Creates a unique name beginning with the specified prefix. 
    Conflicts with key_name. If neither key_name nor key_name_prefix is provided, 
    Terraform will create a unique key name using the prefix terraform-.
    EOT
  default     = null
}



variable "instance_name" {
  type        = string
  description = "(Mandatory) Name of instance, for wich key will be created."

}

variable "group" {
  type        = string
  description = "(Mandatory) Group name of key."

}

variable "region" {
  type        = string
  description = "(Mandatory) Region where key will be created"

}

variable "access_key" {
  type        = string
  description = "(Mandatory) Access key name to access AWS cloud"

}

variable "secret_key" {
  type        = string
  description = "(Mandatory) Secret key to access AWS cloud"
}