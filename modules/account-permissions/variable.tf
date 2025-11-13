variable "account_assignments" {
  description = "A map of account assignments for the permission set"
  type = map(object({
    principal_type = string
    principal_id   = string
    account_id     = string
  }))
  default = {}
  
}
 
variable "permission_set_arn" {
  description = "The ARN of the permission set to assign"
  type        = string
}       

# variable "principal_type" {
#   description = "The type of principal (USER or GROUP)"
#   type        = string
# }   

# variable "principal_id" {
#   description = "The ID of the principal (user or group) in the identity store"
#   type        = string
# }   

# variable "account_ids" {
#     description = "The target AWS account IDs for the assignment"
#     type        = list(string)
# }   

# variable "user_principal_id" {
  
# }

