
variable "role_name" {
  description = "The name of the role. It will forces new resource on change."
  type        = string
}

variable "role_path" {
  description = "The path to the role. See https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html for more information."
  type        = string
  default     = "/"
}

variable "role_description" {
  description = "The description of the role."
  type        = string
}

variable "role_assume_policy" {
  description = "IAM policy document that grants an entity permission to assume the role in JSON format."
  type        = string
}

variable "role_force_detach_policies" {
  description = "Specifies to force detaching any policies the role has before destroying it."
  type        = bool
  default     = false
}

variable "role_max_session_duration" {
  description = "The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours."
  type        = number
  default     = 3600
}

variable "role_permissions_boundary" {
  description = "ARN of the policy that is used to set the permissions boundary for the role"
  type        = string
  default     = null
}

variable "role_managed_policy_arns" {
  description = "Set of exclusive IAM managed policy ARNs to attach to the IAM role."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Additional tags to be put on iam role"
  type        = map(string)
  default     = {}
}
