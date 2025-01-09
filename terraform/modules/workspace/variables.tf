variable "resource_group" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Location"
  type        = string
  default     = "France Central"
}

variable "databricks_workspace" {
  description = "Databricks Workspace name"
  type        = string
  default     = "databricks-workspace-poc"
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
