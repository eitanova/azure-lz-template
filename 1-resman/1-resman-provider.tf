terraform {
  backend "azurerm" {
    use_cli              = true
    use_azuread_auth     = true
    tenant_id            = "a986ce9f-e1ca-45ab-942e-e1ce27106918"
    resource_group_name  = "landing-zone-states"
    storage_account_name = "skystates"
    container_name       = "resman"
    key                  = "terraform.tfstate"
    subscription_id      = "31076e3c-fc5e-4f0b-be52-0eb744e89036"
  }
}


provider "azurerm" {
  features {}
  subscription_id = "31076e3c-fc5e-4f0b-be52-0eb744e89036"
}
