module "resource_group" {
  source = "./modules/resource_group"

  resource_group_name = "${var.function_app_name}-rg"
  location            = var.location
}

module "function_app" {
  source = "./modules/function_app"

  resource_group_name   = module.resource_group.name
  location              = module.resource_group.location
  storage_account_name  = var.storage_account_name
  app_service_plan_name = var.app_service_plan_name
  function_app_name     = var.function_app_name

  depends_on = [ module.resource_group ]
}