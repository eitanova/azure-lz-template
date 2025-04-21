locals {
  _top_level_management_groups = merge(
    { "root" = module.root-level },
    { "security" = module.security-top-level },
    { "shared_services" = module.shared-services-top-level },
    { "decommissioned" = module.decommissioned-top-level },
    module.environments-top-level,
    module.global-shared-services-level
  )
  management_groups = {
    global = {
      for k, v in local._top_level_management_groups : k => {
        id           = v.details.id
        display_name = v.details.display_name
      }
    }
    divisions = {
      for k, v in module.divisions-level : k => {
        id           = v.details.id,
        display_name = v.details.display_name
      }
    }
    units = {
      for k, v in module.units-level : k => {
        id           = v.details.id,
        display_name = v.details.display_name
      }
    }
    subunits = {
      for k, v in module.subunits-level : k => {
        id           = v.details.id,
        display_name = v.details.display_name
      }
    }
    divisions_shared_services = merge({
      for k, v in module.divisions-parent-shared-services-level : k => {
        id           = v.details.id,
        display_name = v.details.display_name
      }
      },
      {
        for k, v in module.divisions-shared-services-level : k => {
          id           = v.details.id,
          display_name = v.details.display_name
        }
    })
  }
  all_subscriptions = merge({
    for k, v in module.shared-services-subscriptions : k => {
      id           = v.details.subscription_id
      display_name = v.details.subscription_name
    }
    },
    {
      for k, v in module.divisions-subscriptions : k => {
        id           = v.details.subscription_id
        display_name = v.details.subscription_name
      }
  })

  tfvars = merge(
    { management_groups = local.management_groups },
    { subscriptions = local.all_subscriptions }
  )
}

resource "local_file" "tfvars" {
  file_permission = "0644"
  filename        = "${var.paths.config}/outputs/1-resman.auto.tfvars.json"
  content         = jsonencode(local.tfvars)
}
