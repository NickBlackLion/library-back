variable "region" {
  default = "eu-central-1"
}

variable "instance_ami" {
  default = "ami-0d2e4df42e13655e0"
}

variable "max_spot_instances" {
  default = 1
}

variable "min_spot_instances" {
  default = 0
}

variable "cluster_name" {
  default = "library"
}
