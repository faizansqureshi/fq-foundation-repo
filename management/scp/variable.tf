
variable "region"{          

  
}

#variable "profile"{          

  
#}
variable "scps" {
  description = "A map of SCP policies with their details"
  type = map(object({
    name             = string
    description      = string
    policy_file_name = string
    targets          = list(string)
  }))
}