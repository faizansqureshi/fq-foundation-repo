#variables
#variable "github_repos" {
#}

#variable "role_name" {
#  
#}

#variable "identifier"{
#
#}


variable "region"{

}

variable "profile"{

}

#variable "policies"{
#
#}


variable "workloads" {
  description = "Map of workloads (key = stable name)."
  type = map(object({
    role_name    = string
    github_repos = list(string)
    identifier   = optional(list(string), []) 
    policies     = optional(list(string), [])
    create_policy_resources = bool
  }))
}


