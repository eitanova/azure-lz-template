terraform {
  backend "azurerm" {
    use_cli              = true
    use_azuread_auth     = true
    tenant_id            = "a986ce9f-e1ca-45ab-942e-e1ce27106918"
    resource_group_name  = "landing-zone-states"
    storage_account_name = "skystates"
    container_name       = "global-shared-services"
    key                  = "terraform.tfstate"
    subscription_id      = "31076e3c-fc5e-4f0b-be52-0eb744e89036"
  }
}
provider "azurerm" {
  features {}
  subscription_id = var.subscriptions["global/prd/network"].id
  alias = "internet-prd"
}
provider "azurerm" {
  features {}
  subscription_id = var.subscriptions["global/dev/network"].id
  alias = "internet-dev"
}
provider "azurerm" {
  features {}
  subscription_id = var.subscriptions["global/prd/management"].id 
  alias = "mgmt"
}
provider "azurerm" {
  features {}
  subscription_id = var.subscriptions["global/prd/on-prem"].id 
  alias = "on-prem"
}
provider "azurerm" {
  features {}
  subscription_id = var.subscriptions["dev/network/untrusted"].id 
  alias = "untrusted-dev"
}
provider "azurerm" {
  features {}
  subscription_id = var.subscriptions["dev/network/trusted"].id 
  alias = "trusted-dev"
}