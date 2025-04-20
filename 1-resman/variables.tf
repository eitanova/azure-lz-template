variable "global_shared_services" {
  description = "configuration for global shared services"
  type = map(object({
    display_name = string
    rbac = optional(map(list(string)), {})
    subscriptions = optional(map(object({
      display_name = string
      tags = optional(map(string), {})
    })), {})
  }))
}
variable "divisions_shared_services" {
  description = "divisions subscriptions"
  type = map(object({
    parent = string
  }))
  default = {}
}