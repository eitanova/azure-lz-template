terraform {
  backend "azurerm" {
    use_cli              = true
    use_azuread_auth     = true
    tenant_id            = "6a80ee49-3cee-4c00-9548-d8dfed5020b8"
    resource_group_name  = "landing-zone-states"
    storage_account_name = "terrastatesdev"
    container_name       = "subscriptions"
    key                  = "turkiz.terraform.tfstate"
    subscription_id      = "cb6a7a77-cdd1-4d79-974a-d6917ccb4ff7"
  }
}


provider "azurerm" {
  features {}
  subscription_id = "cb6a7a77-cdd1-4d79-974a-d6917ccb4ff7"
}
