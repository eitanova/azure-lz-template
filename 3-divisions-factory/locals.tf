locals {
  # Read the division-specific configuration
  division_config = yamldecode(file("${var.paths.config}/divisions/${var.division_name}/config.yml")).environments

  # Map the configuration to the appropriate local variables
  trusted_prod_hub = merge(local.division_config.environments.prd.shared_services.networking.trusted, {
    subnets = {
      palo = local.division_config.environments.prd.shared_services.networking.trusted.subnets.palo.address_prefixes[0]
    }
  })
  untrusted_prod_hub = merge(local.division_config.environments.prd.shared_services.networking.untrusted, {
    subnets = {
      palo = local.division_config.environments.prd.shared_services.networking.untrusted.subnets.palo.address_prefixes[0]
    }
  })
  trusted_ppd_hub = merge(local.division_config.environments.ppd.shared_services.networking.trusted, {
    subnets = {
      palo = local.division_config.environments.ppd.shared_services.networking.trusted.subnets.palo.address_prefixes[0]
    }
  })
  untrusted_ppd_hub = merge(local.division_config.environments.ppd.shared_services.networking.untrusted, {
    subnets = {
      palo = local.division_config.environments.ppd.shared_services.networking.untrusted.subnets.palo.address_prefixes[0]
    }
  })
}
