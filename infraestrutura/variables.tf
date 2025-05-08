variable "subscription_id" {
  description = "ID da assinatura do Azure"
  type        = string
}

variable "environment" {
  description = "Ambiente de implantação (dev, test, prod)"
  type        = string
}

variable "storage_account_name" {
  description = "Nome da conta de armazenamento do Azure"
  type        = string
}

variable "app_service_plan_name" {
  description = "Nome do plano de serviço do Azure App Service"
  type        = string
}

variable "function_app_name" {
  description = "Nome do aplicativo de função do Azure"
  type        = string
}

variable "location" {
  description = "Localização do recurso"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Nome do grupo de recursos do Azure"
  type        = string
}