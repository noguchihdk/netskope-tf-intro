terraform {
  required_providers {
    netskope = {
      version = "0.2.1"
      source = "netskopeoss/netskope"
    }
  }
}

provider "netskope" {
    baseurl = "https://nttdbxo.goskope.com"
    apitoken = "0f59fe669606933edd753e34918785b1"
  }

// Publisher (NS console)
resource "netskope_publishers" "Publisher" {
    name = "Example-Publisher"
}

output "publisher_details" {
    value = {
            name  = "${netskope_publishers.Publisher.name}"
            token ="${netskope_publishers.Publisher.token}"
    }
}

// PrivateApp (NS console)
resource "netskope_privateapps" "PrivateApp" {
  app_name = "Example-Private-App"
  host = "site.examble.internal"

  protocols {
    type = "tcp"
    port = "22,443,8080-8081"
  }

  publisher {
    publisher_id = netskope_publishers.Publisher.id
    publisher_name = netskope_publishers.Publisher.name
  }

}

// aws region
provider "aws" {
  region = "ap-northeast-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "publisher-aws" {
  source = "netskopeoss/publisher-aws/netskope"

  publisher_name              = var.publisher_name
  aws_key_name                = var.aws_key_name
  aws_subnet                  = var.aws_subnet_id
  aws_security_group          = var.aws_sg_id
  associate_public_ip_address = var.associate_public_ip_address



}

