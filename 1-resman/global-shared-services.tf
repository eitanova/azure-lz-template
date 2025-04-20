locals {
  subscriptions = merge(flatten([
    for k, v in var.global_shared_services : [
      for id, data in v.subscriptions : {
        "${id}" = merge(data, { parent = k })
      }
    ]
    ])...
  )
}

module "shared-services-subscriptions" {
  source   = "../modules/subscription"
  for_each = local.subscriptions

  alias        = each.key
  display_name = each.value.display_name
  tags         = each.value.tags

  parent_id = module.global-shared-services-level[each.value.parent].details.id

  billing = {
    name            = var.tenant.billing_name
    enrollment_name = var.tenant.enrollment_account
  }
}
