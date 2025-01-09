
variable "location" {
  description = "Location"
  type        = string
  default     = "France Central"
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}

variable "host" {
  description = "Databricks Host"
  type        = string
}

variable "create_cluster" {
  type    = bool
  default = true
}