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

variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}