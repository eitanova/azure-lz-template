variable "initiatives" {
  description = "policy defintion configuration"
  type = map(object({
    name        = string
    scope       = string
    id          = optiona(string, null)
    description = optional(string, "")
    policies    = list(any)
  }))
  default = {}
}
