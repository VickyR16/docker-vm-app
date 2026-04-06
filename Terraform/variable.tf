variable "vmname" {
  type    = string
  default = "vm1"
}

variable "admin_password" {
  type      = string
  default   = "admin@123"
  sensitive = true
}

variable "admin_username" {
  type    = string
  default = "vicky"
}