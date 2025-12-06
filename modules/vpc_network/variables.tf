variable "project" {
  type = string
}

variable "name" {
  type = string
}

variable "subnets" {
  type = map(object({
    ip_cidr_range = string
    region        = string
  }))
}

variable "psa_address" {
  type = string
}

variable "psa_prefix_length" {
  type = number
}
