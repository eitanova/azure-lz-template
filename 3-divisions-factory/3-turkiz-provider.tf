terraform {
  backend "azurerm" {
    use_cli              = true
    use_azuread_auth     = true
    tenant_id            = "a986ce9f-e1ca-45ab-942e-e1ce27106918"
    resource_group_name  = "landing-zone-states"
    storage_account_name = "skystates"
    container_name       = "divisions"
    key                  = "turkiz.terraform.tfstate"
    subscription_id      = "31076e3c-fc5e-4f0b-be52-0eb744e89036"
  }
}


provider "azurerm" {
  features {}
  subscription_id = var.subscriptions["prd/turkiz/networking/trusted"].id
  alias = "trusted-prd"
}
provider "azurerm" {
  features {}
  subscription_id = var.subscriptions["prd/turkiz/networking/untrusted"].id
  alias = "untrusted-prd"
}
provider "azurerm" {
  features {}
  subscription_id = var.subscriptions["ppd/turkiz/networking/trusted"].id
  alias = "trusted-ppd"
}
provider "azurerm" {
  features {}
  subscription_id = var.subscriptions["ppd/turkiz/networking/untrusted"].id  
  alias = "untrusted-ppd"
}
provider "azurerm" {
  features {}
  subscription_id = var.subscriptions["global/prd/network"].id
  alias = "internet-prd"
}
provider "azurerm" {
  features {}
  subscription_id = var.subscriptions["global/prd/on-prem"].id 
  alias = "on-prem"
}