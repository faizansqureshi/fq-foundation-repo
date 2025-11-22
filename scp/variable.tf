variable "name" {
  
  description = "The name of the SCP policy"        
}   

variable "description" {
  
}


variable "targets" {
  description = "The list of target IDs (accounts or organizational units) to attach the SCP policy to"
}

variable "policy_file_name" {
  description = "The name of the JSON file containing the SCP policy content"
}

variable "region"{          

  
}

variable "profile"{          

  
}