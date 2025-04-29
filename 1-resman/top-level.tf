
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

  depends_on = [ module.root-level ]
}
module "shared-services-top-level" {
  source       = "../modules/management-group"
  id           = "sky-shared-services"
  display_name = "Sky Shared Services"
  parent_id    = module.root-level.details.id
  
  depends_on = [ module.root-level ]
}
# module "decommissioned-top-level" {
#   source       = "../modules/management-group"
#   id           = "decommissioned-subscriptions"
#   display_name = "Decommissioned"
#   parent_id    = module.root-level.details.id

#   depends_on = [ module.root-level ]
# }
module "dev-shared-services-top-level" {
  source       = "../modules/management-group"
  id           = "sky-dev-shared-services"
  display_name = "Dev Shared Services"
  parent_id    = module.environments-top-level["dev"].details.id
  
  depends_on = [ module.environments-top-level ]
}
module "environments-top-level" {
  source       = "../modules/management-group"
  for_each     = var.environments
  id           = each.key
  display_name = each.value.name
  parent_id    = module.root-level.details.id

  depends_on = [ module.root-level ]
}

# Global shared services
module "global-shared-services-level" {
  source   = "../modules/management-group"
  for_each = var.global_shared_services

  display_name = each.value.display_name
  parent_id    = module.shared-services-top-level.details.id
  id           = each.key

  depends_on = [ module.shared-services-top-level ]
}