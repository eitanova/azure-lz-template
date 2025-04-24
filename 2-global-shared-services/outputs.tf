locals {
  global_vnets = {
    "internet_prd"  = module.internet_prd_hub.id
    "internet_dev"  = module.internet_dev_hub.id
    "trusted_dev"   = module.trusted_dev_hub.id
    "untrusted_dev" = module.untrusted_dev_hub.id
    "management"    = module.mgmt_hub.id
    "on-prem"       = module.on_prem_hub.id
  }
  tfvars = merge(
    { global_vnets = local.global_vnets },
    { }
  )
}

resource "local_file" "tfvars" {
  file_permission = "0644"
  filename        = "${var.paths.config}/outputs/1-global-shared-services.auto.tfvars.json"
  content         = jsonencode(local.tfvars)
}
