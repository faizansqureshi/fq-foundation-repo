variable "name" {
  description = "Name of the AWS SSO permission set. AWS limits this to 32 characters."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0 && length(var.name) <= 32
    error_message = "AWS SSO permission set names must be between 1 and 32 characters in length."
  }
}

variable "managed_policy_arns" {
  description = "List of managed policy ARNs to attach to the permission set"
  type        = list(string)
  default     = []
}
variable "custom_policy_names" {
  description = "List of custom policy names to attach to the permission set example (fq-ec2-operate,fq...)"
  type        = list(string)
  default     = []
}

variable "inline_policy" {
  description = "Inline policy document to attach to the permission set"
  type        = string
  default     = null

}