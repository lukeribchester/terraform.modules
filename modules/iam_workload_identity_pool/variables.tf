variable "project" {
  type = string
}

# Workload Identity Pool
variable "workload_identity_pool_id" {
  type = string
}

# Workload Identity Pool Provider
variable "workload_identity_pool_provider_id" {
  type = string
}

variable "disabled" {
  type = bool
}

variable "attribute_condition" {
  type = string
}

variable "attribute_mapping" {
  type = map(string)
}

variable "issuer_uri" {
  type = string
}
