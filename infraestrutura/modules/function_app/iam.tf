
resource "azurerm_role_assignment" "function_app_storage_access" {
  principal_id         = azurerm_linux_function_app.function_app.identity[0].principal_id
  role_definition_name = "Storage Blob Data Contributor"
  scope                = azurerm_storage_account.function_storage.id
}