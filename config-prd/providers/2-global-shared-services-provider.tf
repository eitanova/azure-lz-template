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