variable "name" {
  description = "resource group name"
  type        = string
}
variable "tags" {
  description = "key value tags"
  type        = map(string)
  default     = {}
}
variable "location" {
  description = "resource group location"
  type        = string
  default     = null
}

variable "subscription_id" {
  description = "subscription id for remote provider"
  type = string
  default = null
}