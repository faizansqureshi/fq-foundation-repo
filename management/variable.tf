variable "region"{          

  
}

variable "profile"{          

  
}

variable "name" {
  
}

variable "managed_policy_arns" {
  description = "List of managed policy ARNs to attach to the permission set"
  type        = list(string)
  default = []
}
variable "custom_policy_names" {
  description = "List of custom policy names to attach to the permission set example (fq-ec2-operate,fq...)"
  type        = list(string)
  default = []
}

variable "inline_policy" {
  description = "Inline policy document to attach to the permission set"
  type        = string
  default     = null        
    
}