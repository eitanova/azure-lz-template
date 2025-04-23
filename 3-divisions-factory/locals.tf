locals {
  # Read the division-specific configuration
  division_config = yamldecode(file("${var.paths.config}/divisions/${var.division_name}/config.yml"))

  # Map the configuration to the appropriate local variables
  trusted_prod_hub   = local.division_config.environments.prd.shared_services.networking.trusted
  untrusted_prod_hub = local.division_config.environments.prd.shared_services.networking.untrusted
  trusted_ppd_hub    = local.division_config.environments.ppd.shared_services.networking.trusted
  untrusted_ppd_hub  = local.division_config.environments.ppd.shared_services.networking.untrusted
}
