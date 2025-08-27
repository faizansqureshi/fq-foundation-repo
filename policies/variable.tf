variable "policy_prefix" {
  description = "The suffix to use for the policies e.g. 'myuniquestring'"
  type        = string
  default     = "fq"
}

variable "create_policy_resources" {
  description = "Whether to create the policy resources"
  type        = bool
  default     = true
}