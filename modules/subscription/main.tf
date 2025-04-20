resource "azurerm_subscription" "subscription" {
  subscription_name = var.display_name
  alias            = var.alias
  billing_scope_id = "/providers/Microsoft.Billing/billingAccounts/${var.billing.name}/enrollmentAccounts/${var.billing.enrollment_name}"
  tags             = var.tags
}
resource "azurerm_management_group_subscription_association" "association" {
  management_group_id = var.parent_id
  subscription_id     = "/subscriptions/${azurerm_subscription.subscription.subscription_id}"
}
