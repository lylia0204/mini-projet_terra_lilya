variable "user_name" {
  type    = string
  default = "lilya"
}

variable "zone_dispo" {
  type    = string
  default = "us-east-1a"
}

variable "type_instance" {
  type    = string
  default = "t2.nano"
}

variable "key_ssh" {
  type    = string
  default = "lilya-kp-ajc"
}

variable "security_group" {
  type    = string
  default = "NULL"
}

variable "ip_pub" {
  type    = string
  default = "NULL"
}

variable "user" {
  type    = string
  default = "NULL"
}

variable "id_compte_ubuntu" {
  type    = string
  default = "099720109477"
}

variable "nom_ubuntu_ami" {
  type    = string
  default = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
}
