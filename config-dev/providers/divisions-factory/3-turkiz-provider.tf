terraform {
  backend "azurerm" {
    use_cli              = true
    use_azuread_auth     = true
    tenant_id            = "6a80ee49-3cee-4c00-9548-d8dfed5020b8"
    resource_group_name  = "landing-zone-states"
    storage_account_name = "terrastatesdev"
    container_name       = "divisions"
    key                  = "turkiz.terraform.tfstate"
    subscription_id      = "cb6a7a77-cdd1-4d79-974a-d6917ccb4ff7"
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
  alias = "internet"
}
provider "azurerm" {
  features {}
  subscription_id = var.subscriptions["global/prd/on-prem"].id 
  alias = "on-prem"
}