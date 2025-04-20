
# Root level
module "root-level" {
  source       = "../modules/management-group"
  id           = var.tenant.name
  display_name = var.tenant.display_name
  parent_id    = "/providers/Microsoft.Management/managementGroups/${var.tenant.id}"
}

# Top level (below the root)
module "security-top-level" {
  source       = "../modules/management-group"
  id           = "cross-cloud-security"
  display_name = "Cross Cloud Security"
  parent_id    = module.root-level.details.id
}
module "shared-services-top-level" {
  source       = "../modules/management-group"
  id           = "global-shared-services"
  display_name = "Global Shared Services"
  parent_id    = module.root-level.details.id
}
module "decommissioned-top-level" {
  source       = "../modules/management-group"
  id           = "decommissioned-subscriptions"
  display_name = "Decommissioned"
  parent_id    = module.root-level.details.id
}
module "environments-top-level" {
  source       = "../modules/management-group"
  for_each     = var.environments
  id           = each.key
  display_name = each.value.name
  parent_id    = module.root-level.details.id
}

# Global shared services
module "global-shared-services-level" {
  source   = "../modules/management-group"
  for_each = var.global_shared_services

  display_name = each.value.display_name
  parent_id    = module.shared-services-top-level.details.id
  id           = each.key
}