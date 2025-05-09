resource "azurerm_storage_account" "function_storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "function_container" {
  name                  = "flexcontainer-${var.function_app_name}"
  storage_account_id    = azurerm_storage_account.function_storage.id
  container_access_type = "private"
}

resource "azurerm_service_plan" "function_plan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "Y1"  
}

resource "azurerm_linux_function_app" "function_app" {
  name                 = var.function_app_name
  resource_group_name  = var.resource_group_name
  location             = var.location
  service_plan_id      = azurerm_service_plan.function_plan.id
  storage_account_name = azurerm_storage_account.function_storage.name
  storage_account_access_key = azurerm_storage_account.function_storage.primary_access_key
  identity {
    type = "SystemAssigned"
  }
  site_config {}
  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "node"
  }
  lifecycle {
    ignore_changes = [app_settings.WEBSITE_RUN_FROM_PACKAGE]
  }
}

resource "azurerm_linux_function_app_slot" "function_app_slot" {
  name                       = "HOM"
  function_app_id            = azurerm_linux_function_app.function_app.id
  storage_account_name       = azurerm_storage_account.function_storage.name
  storage_account_access_key = azurerm_storage_account.function_storage.primary_access_key
  site_config {}
  identity {
    type = "SystemAssigned"
  }
  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "node"
  }
  lifecycle {
    ignore_changes = [app_settings.WEBSITE_RUN_FROM_PACKAGE]
  }
}