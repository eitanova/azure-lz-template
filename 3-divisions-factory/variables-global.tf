variable "environments" {
  description = "key map value of environment key and envrionment values"
  type        = map(map(string))
  default     = {}
}
variable "paths" {
  description = "paths for various locations"
  type        = map(string)
  default     = {}
}
variable "tenant" {
  description = "tenant details"
  type = object({
    id                 = string
    name               = string
    display_name       = string
    prefix             = optional(string, null)
    billing_name       = string
    enrollment_account = string
    location           = string
  })
}

variable "subscriptions" {
  type = map(object({
    id           = string
    display_name = string
  }))
}

variable "prod_internet_vnet_id" {
  type        = string
  description = "The id of the internet hub vnet for the prd spoke"
}

variable "prod_internet_vnet_name" {
  type        = string
  description = "The name of the internet hub vnet for the prd spoke"
}

variable "prod_internet_vnet_rg" {
  type        = string
  description = "The rg of the internet hub vnet for the prd spoke"
}

variable "on_prem_vnet_id" {
  type        = string
  description = "The id of the on prem hub vnet"
}

variable "on_prem_vnet_name" {
  type        = string
  description = "The name of the internet hub vnet for the dev spoke"
}

variable "on_prem_vnet_rg" {
  type        = string
  description = "The rg of the internet hub vnet for the dev spoke"
}

