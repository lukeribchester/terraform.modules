variable "project" {
  type = string
}

# Artifact Registry Repository
variable "repository_id" {
  type = string
}

variable "location" {
  type = string
}

variable "format" {
  type = string
}

# IAM
variable "readers" {
  type    = set(string)
  default = []
}

variable "writers" {
  type    = set(string)
  default = []
}
