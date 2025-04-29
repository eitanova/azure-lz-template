locals {
  subscriptions_config = {
    for file in fileset("${var.paths.config}/${var.division_path}/**", "*.yml") :
    split(".", trimprefix(file, "../"))[0] => try(yamldecode(file("${var.paths.config}/${var.division_path}/${trimprefix(file, "../")}")), {})
  }
}
module "divisions-subscriptions" { 
  source = "../modules/subscription"

  for_each = local.subscriptions_config

  display_name = each.value.display_name
  tags         = each.value.tags

  parent_id = "/providers/Microsoft.Management/managementGroups/${each.value.parent_id}"
  billing = {
    name            = var.tenant.billing_name
    enrollment_name = var.tenant.enrollment_account
  }
}