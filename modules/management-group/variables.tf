variable "display_name" {
  description = "management group display name"
  type        = string
}

variable "id" {
  description = "management group id"
  type        = string
  default     = null
}

variable "parent_id" {
  description = "management group parent id"
  type        = string
}
variable "rbac" {
  description = "rbac permission of type: ROLE => [PRINCIPALS]"
  type        = map(list(string))
  default     = {}
}
variable "assignments" {
  description = "policy assignment"
  type        = list(string)
  default = []
}
