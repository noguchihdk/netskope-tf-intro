variable "publisher_name" {
  type = string
}

variable "aws_key_name" {
  type = string
}

variable "aws_subnet_id" {
  type = string
}

variable "aws_sg_id" {
  type = string
}

variable "associate_public_ip_address" {
  type = bool
  default = false
}
