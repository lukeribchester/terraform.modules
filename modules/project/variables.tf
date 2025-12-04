# Project
variable "name" {
  type = string
}

variable "project_id" {
  type = string
}

variable "org_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "billing_account" {
  type = string
}

# Services
variable "services" {
  type    = list(string)
  default = []
}
