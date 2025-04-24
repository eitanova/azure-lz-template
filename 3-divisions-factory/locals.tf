locals {
  # Read the division-specific configuration
  division_config = yamldecode(file("${var.paths.config}/divisions/${var.division_name}/config.yml")).environments

  # Map the configuration to arrays of hubs
  trusted_prod_hubs = [
    for hub in try(local.division_config.prd.shared_services.networking.trusted, []) : merge(hub, {
      subnets = {
        palo = hub.subnets.palo.address_prefixes[0]
      }
    })
  ]

  untrusted_prod_hubs = [
    for hub in try(local.division_config.prd.shared_services.networking.untrusted, []) : merge(hub, {
      subnets = {
        palo = hub.subnets.palo.address_prefixes[0]
      }
    })
  ]

  trusted_ppd_hubs = [
    for hub in try(local.division_config.ppd.shared_services.networking.trusted, []) : merge(hub, {
      subnets = {
        palo = hub.subnets.palo.address_prefixes[0]
      }
    })
  ]

  untrusted_ppd_hubs = [
    for hub in try(local.division_config.ppd.shared_services.networking.untrusted, []) : merge(hub, {
      subnets = {
        palo = hub.subnets.palo.address_prefixes[0]
      }
    })
  ]
}
