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
