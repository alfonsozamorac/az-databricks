
output "workspace_url" {
  description = "Workspace url."
  value       = azurerm_databricks_workspace.workspace.workspace_url
  sensitive   = true
}
