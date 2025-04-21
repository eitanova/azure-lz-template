variable "display_name" {
  description = "subscription name"
  type        = string
  default     = null
}
variable "alias" {
  description = "subscription id"
  type        = string
  default     = null
}
variable "billing" {
  description = "details for billing account"
  type = object({
    name            = string
    enrollment_name = string
  })
  default = {
    name = null
    enrollment_name = null
  }
}
variable "tags" {
  description = "key value tags"
  type = map(string)
  default = {}
}
variable "parent_id" {
  description = "management group id association"
  type = string
  default = null
}
variable "rbac" {
  description = "rbac permission of type: ROLE => [PRINCIPALS]"
  type        = map(list(string))
  default     = {}
}