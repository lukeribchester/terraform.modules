# Service Account
variable "service_account_id" {
  type = string
}

# Cloud Run
variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "deletion_protection" {
  type = bool
}

variable "ingress" {
  type = string
}

variable "project" {
  type = string
}

variable "min_instance_count" {
  type = number
}

variable "max_instance_count" {
  type = number
}

variable "max_instance_request_concurrency" {
  type = number
}

variable "image" {
  type = string
}

# Domain Mapping
variable "domains" {
  type    = set(string)
  default = []
}

# IAM
variable "developers" {
  type    = set(string)
  default = []
}

variable "service_account_users" {
  type    = set(string)
  default = []
}
