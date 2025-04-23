locals {
  dev_hubs  = yamldecode(file("${var.paths.config}/networking/hubs/development.yml"))
  mgmt_hubs = yamldecode(file("${var.paths.config}/networking/hubs/management.yml"))
  prod_hubs = yamldecode(file("${var.paths.config}/networking/hubs/production.yml"))

  global_hubs = merge(
    local.dev_hubs.hubs,
    local.mgmt_hubs.hubs,
    local.prod_hubs.hubs
  )
} 
