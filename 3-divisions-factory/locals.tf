locals {
  division_config = yamldecode(file("${path.root}/config-dev/divisions/${var.division_name}/config.yml"))
  
  trusted_prod_hubs = {
    (var.division_name) = local.division_config.hubs["trusted-prod"]
  }
  untrusted_prod_hubs = {
    (var.division_name) = local.division_config.hubs["untrusted-prod"]
  }
  trusted_ppd_hubs = {
    (var.division_name) = local.division_config.hubs["trusted-ppd"]
  }
  untrusted_ppd_hubs = {
    (var.division_name) = local.division_config.hubs["untrusted-ppd"]
  }
}
