terraform {
  backend "azurerm" {
    use_cli              = true
    use_azuread_auth     = true
    tenant_id            = "6a80ee49-3cee-4c00-9548-d8dfed5020b8"
    resource_group_name  = "landing-zone-states"
    storage_account_name = "terrastatesdev"
    container_name       = "global-shared-services"
    key                  = "terraform.tfstate"
    subscription_id      = "cb6a7a77-cdd1-4d79-974a-d6917ccb4ff7"
  }
}


provider "azurerm" {
  features {}
  subscription_id = var.subscriptions["global-network-prd-0"].id #"e479f740-ea3e-40e0-b7c8-45f109893c51" # Production subscription
  alias = "net-prd"
}
provider "azurerm" {
  features {}
  subscription_id = var.subscriptions["global-network-dev-0"].id # "44af6658-24ba-481e-bfa3-d76fd600e288" # Dev subscription
  alias = "net-dev"
}
provider "azurerm" {
  features {}
  subscription_id = var.subscriptions["global-management-0"].id # "44af6658-24ba-481e-bfa3-d76fd600e288" # Dev subscription
  alias = "mgmt"
}