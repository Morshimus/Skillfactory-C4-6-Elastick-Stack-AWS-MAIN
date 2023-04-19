variable "region" {
  type        = string
  description = "(Mandatory) Common region where resources will be created"
  default     = "eu-west-2"
}


variable "availability_zone" {
  type        = string
  description = "(Mandatory) VPC vailability network zone"
  default     = "eu-west-2a"
}

variable "label_name_vpc" {
  type        = string
  description = "Name of VPC"
  default     = "morsh-vpc"

}

variable "group" {
  type        = string
  description = "Name of specific host group"
  default     = "monitoring"

}

#variable "instance_label_name" {
#  type    = string
#  default = "ELK"
#}

variable "key_instance_name" {
  type    = string
  default = "for-monitoring-servers"

}

variable "image_name" {
  type        = list(string)
  description = "(Mandatory) Filter for searching AMI by name"

}

variable "image_owners" {
  type        = list(string)
  description = "(Mandatory) Accepted AMI owners"

}

variable "instance_type" {
  type        = string
  description = "(Mandatory) Type of EC2 vm machine."

}