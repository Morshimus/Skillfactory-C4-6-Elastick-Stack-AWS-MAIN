################# Network VPC ###################################################

resource "aws_vpc" "this" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = var.label_name_vpc
  }
}



resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
  tags = {
    Name = "morsh-routing-table"
  }
}


resource "aws_main_route_table_association" "this" {
  vpc_id         = aws_vpc.this.id
  route_table_id = aws_route_table.this.id
  depends_on     = [aws_route_table.this]
}


resource "aws_subnet" "this" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = var.availability_zone

  depends_on = [aws_internet_gateway.this]
  tags = {
    Name = "morsh-subnet"
  }
}

############ WAN segment ################################################

resource "aws_eip" "public_ip_1" {
  vpc                       = true
  network_interface         = aws_network_interface.Elasticsearch.id
  associate_with_private_ip = "172.16.10.100"
  depends_on                = [aws_internet_gateway.this]
}

resource "aws_eip" "public_ip_2" {
  vpc                       = true
  network_interface         = aws_network_interface.Kibana.id
  associate_with_private_ip = "172.16.10.101"
  depends_on                = [aws_internet_gateway.this]
}

resource "aws_eip" "public_ip_3" {
  vpc                       = true
  network_interface         = aws_network_interface.Logstash.id
  associate_with_private_ip = "172.16.10.102"
  depends_on                = [aws_internet_gateway.this]
}


resource "aws_eip" "public_ip_4" {
  vpc                       = true
  network_interface         = aws_network_interface.app.id
  associate_with_private_ip = "172.16.10.103"
  depends_on                = [aws_internet_gateway.this]
}

##################### Security Groups ##################################################3

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.this.id
}

resource "aws_security_group" "allow_ingeress_egress" {
  name        = "allow_ingress_egress"
  description = "Allow inbound and outbound traffic"
  vpc_id      = aws_vpc.this.id


  ingress {
    description = "Nginx from Oustside"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Elasticsearch for Internal"
    from_port   = 9200
    to_port     = 9200
    protocol    = "tcp"
    cidr_blocks = ["172.16.10.0/24"]
  }

  ingress {
    description = "Logstash for Internal filebeat"
    from_port   = 5044
    to_port     = 5044
    protocol    = "tcp"
    cidr_blocks = ["172.16.10.0/24"]
  }


  ingress {
    description = "Logstash for Internal syslog"
    from_port   = 10514
    to_port     = 10514
    protocol    = "tcp"
    cidr_blocks = ["172.16.10.0/24"]
  }  


  ingress {
    description = "Kibana from Oustside"
    from_port   = 5601
    to_port     = 5601
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description = "SSH from Oustside"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description      = "Internet to Oustside"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

########## ELK Instances #######################################################

resource "aws_network_interface" "Elasticsearch" {
  subnet_id       = aws_subnet.this.id
  private_ips     = ["172.16.10.100"]
  security_groups = [aws_security_group.allow_ingeress_egress.id]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_network_interface" "Kibana" {
  subnet_id       = aws_subnet.this.id
  private_ips     = ["172.16.10.101"]
  security_groups = [aws_security_group.allow_ingeress_egress.id]

  tags = {
    Name = "primary_network_interface"
  }
}


resource "aws_network_interface" "Logstash" {
  subnet_id       = aws_subnet.this.id
  private_ips     = ["172.16.10.102"]
  security_groups = [aws_security_group.allow_ingeress_egress.id]

  tags = {
    Name = "primary_network_interface"
  }
}

module "aws_instances_elk" {
  source = "./INSTANCE"

  for_each = toset(["Elasticsearch", "Kibana", "Logstash"])

  key_name      = module.aws_key_pair.key_name
  image_name    = var.image_name
  image_owners  = var.image_owners
  group         = var.group
  name          = "morsh_${each.key}"
  instance_type = var.instance_type

  monitoring = true

  #access_key = local.aws_auth.access-key
  #secret_key = local.aws_auth.secret-key
  #region     = var.region

  metadata_options = {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
  root_block_device = [{

    encrypted   = true
    volume_size = 30

  }]

  network_interface = [{
    network_interface_id = each.key == "Kibana" || each.key == "Logstash" || each.key != "Elasticsearch" ? each.key == "Kibana" ? aws_network_interface.Kibana.id : aws_network_interface.Logstash.id : aws_network_interface.Elasticsearch.id
    device_index         = 0
  }]
}

########## APP Instances ###########################################
resource "aws_network_interface" "app" {
  subnet_id       = aws_subnet.this.id
  private_ips     = ["172.16.10.103"]
  security_groups = [aws_security_group.allow_ingeress_egress.id]

  tags = {
    Name = "primary_network_interface"
  }
}
module "aws_instances_app" {
  source = "./INSTANCE"

  key_name      = module.aws_key_pair.key_name
  image_name    = var.image_name
  image_owners  = var.image_owners
  group         = var.group
  name          = "morsh-app"
  instance_type = var.instance_type

  monitoring = true

  #access_key = local.aws_auth.access-key
  #secret_key = local.aws_auth.secret-key
  #region     = var.region

  metadata_options = {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
  root_block_device = [{

    encrypted   = true
    volume_size = 30

  }]

  network_interface = [{
    network_interface_id = aws_network_interface.app.id
    device_index         = 0
  }]
}
######################## Keys #########################################################3

module "aws_key_pair" {
  source        = "./KEY"
  instance_name = var.key_instance_name
  region        = var.region
  group         = var.group
  access_key    = local.aws_auth.access-key
  secret_key    = local.aws_auth.secret-key

}



################## Local resources #############################################

resource "random_string" "this_route_id" {
  length  = 8
  upper   = false
  numeric = true
  lower   = true
  special = false
}



resource "local_file" "aws_private_key" {
  content  = module.aws_key_pair.tls_private_key
  filename = "${path.module}/morsh_server_SSH"
}



resource "local_file" "aws_inventory" {
  content  = local.ansible_template
  filename = "${path.module}/aws_cloud.ini"

  provisioner "local-exec" {
    command     = "Wait-Event -Timeout 60;wsl -e /bin/bash -c 'cp .vault_pass_C46  ~/.vault_pass_C46 ; chmod 0600 ~/.vault_pass_C46';wsl -e /bin/bash -c 'cp morsh_server_SSH  ~/.ssh/morsh_server_SSH ; chmod 0600 ~/.ssh/morsh_server_SSH'; . ./actions.ps1;ansible-playbook -secret"
    interpreter = ["powershell.exe", "-NoProfile", "-c"]
  }

}