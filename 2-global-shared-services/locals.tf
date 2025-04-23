locals {
  dev_hubs  = yamldecode(file("${var.paths.config}/networking/hubs/development.yml"))
  mgmt_hubs = yamldecode(file("${var.paths.config}/networking/hubs/management.yml"))
  prod_hubs = yamldecode(file("${var.paths.config}/networking/hubs/production.yml"))

  # Transform the subnet configuration for each hub
  transformed_dev_hubs = {
    for hub_name, hub_config in local.dev_hubs.hubs : hub_name => merge(
      hub_config,
      {
        subnets = {
          for subnet_name, subnet_config in hub_config.subnets : subnet_name => subnet_config.address_prefixes[0]
        }
      }
    )
  }

  transformed_mgmt_hubs = {
    for hub_name, hub_config in local.mgmt_hubs.hubs : hub_name => merge(
      hub_config,
      {
        subnets = {
          for subnet_name, subnet_config in hub_config.subnets : subnet_name => subnet_config.address_prefixes[0]
        }
      }
    )
  }

  transformed_prod_hubs = {
    for hub_name, hub_config in local.prod_hubs.hubs : hub_name => merge(
      hub_config,
      {
        subnets = {
          for subnet_name, subnet_config in hub_config.subnets : subnet_name => subnet_config.address_prefixes[0]
        }
      }
    )
  }

  global_hubs = merge(
    local.transformed_dev_hubs,
    local.transformed_mgmt_hubs,
    local.transformed_prod_hubs
  )
}
