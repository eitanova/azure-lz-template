variable "division_name" {
  type        = string
  description = "The name of the division to create the Hub for"
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
