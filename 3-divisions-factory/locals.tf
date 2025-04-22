locals {
  # Read the division-specific configuration
  division_config = yamldecode(file("${path.root}/config-dev/divisions/${var.division_name}/config.yml"))

  # Map the configuration to the appropriate local variables
  trusted_prod_hub   = local.division_config.hubs["trusted-prd"]
  untrusted_prod_hub = local.division_config.hubs["untrusted-prd"]
  trusted_ppd_hub    = local.division_config.hubs["trusted-ppd"]
  untrusted_ppd_hub  = local.division_config.hubs["untrusted-ppd"]
}
