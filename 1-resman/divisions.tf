locals {
  _hierarchy_files_path = "${var.paths.config}/divisions"
  _hierarchy_data = {
    for file in fileset("${local._hierarchy_files_path}/**", "config.yml") :
    trimprefix(split("/config.yml", file)[0], "../") => try(yamldecode(file("${local._hierarchy_files_path}/${trimprefix(file, "../")}")), {})
  }
  subunits = merge(flatten([
    for hierarchy, data in local._hierarchy_data : [
      for env in keys(var.environments) : {
        "${env}/${hierarchy}" = {
          parent_key   = "${env}/${split("/", hierarchy)[0]}/${split("/", hierarchy)[1]}"
          display_name = data.name
          id           = "${lower(replace(data.name, " ", "-"))}-${env}"
        }
      }
      if data.type == "subunit" && try(contains(keys(data.environments), env), false)
    ]
    ])...
  )
  units = merge(flatten([
    for hierarchy, data in local._hierarchy_data : [
      for env in keys(var.environments) : {
        "${env}/${hierarchy}" = {
          parent_key   = "${env}/${split("/", hierarchy)[0]}"
          display_name = data.name
          id           = "${lower(replace(data.name, " ", "-"))}-${env}"
        }
      }
      if data.type == "unit"
    ]
    ])...
  )
  divisions = merge(flatten([
    for hierarchy, data in local._hierarchy_data : [
      for env in keys(var.environments) : {
        "${env}/${hierarchy}" = {
          env             = env
          display_name    = data.name
          id              = "${lower(replace(data.name, " ", "-"))}-${env}"
          shared_services = try(data.environments[env].shared_services, {})
        }
      }
      if data.type == "division"
    ]
    ])...
  )
  divisions_shared_management_groups = merge(flatten([
    for division, d_data in local.divisions : [
      for service, s_data in d_data.shared_services : {
        "${division}/${service}" = {
          env          = d_data.env
          display_name = title(service)
          service      = service
          division_id  = d_data.id
          parent       = division
        }
      }
      if(service == "networking" && d_data.env != "dev") || (service != "networking")
    ]
    ])...
  )
  
  divisions_shared_subscriptions = merge(flatten([
    for service, s_data in local.divisions_shared_management_groups : [
      for sub, sub_data in var.divisions_shared_services : {
        "${service}/${sub}" = {
          env          = s_data.env
          display_name = title(sub)
          id           = "${var.tenant.name}-${s_data.division_id}-${sub}-0"
          service      = service
          tags         = lookup(sub_data, "tags", {})
        }
      }
    ]
    ])...
  )
}
# Divisions level
module "divisions-level" {
  source   = "../modules/management-group"
  for_each = local.divisions

  display_name = each.value.display_name
  parent_id    = module.environments-top-level[each.value.env].details.id
  id           = each.value.id
}
module "units-level" {
  source   = "../modules/management-group"
  for_each = local.units

  display_name = each.value.display_name
  parent_id    = module.divisions-level[each.value.parent_key].details.id
  id           = each.value.id
}
module "subunits-level" {
  source   = "../modules/management-group"
  for_each = local.subunits

  display_name = each.value.display_name
  parent_id    = module.units-level[each.value.parent_key].details.id
  id           = each.value.id
}

# Shared Services
module "divisions-parent-shared-services-level" {
  source = "../modules/management-group"

  for_each = {
    for k, v in local.divisions : k => v
    if v.shared_services != null
  }

  display_name = "Shared Services"
  parent_id    = module.divisions-level[each.key].details.id
  id           = "${each.value.id}-shared-services"
}
module "divisions-shared-services-level" {
  source = "../modules/management-group"

  for_each = local.divisions_shared_management_groups

  display_name = each.value.display_name
  parent_id    = module.divisions-parent-shared-services-level[each.value.parent].details.id
  id           = "${each.value.division_id}-${each.value.service}-services"
}
module "divisions-subscriptions" { # validate one subscription for prd and ppd
  source = "../modules/subscription"

  for_each = local.divisions_shared_subscriptions

  alias        = each.value.id
  display_name = each.value.display_name
  tags         = each.value.tags

  parent_id = module.divisions-shared-services-level[each.value.service].details.id

  billing = {
    name            = var.tenant.billing_name
    enrollment_name = var.tenant.enrollment_account
  }
}
