module permission-sets {
  for_each = var.permission-sets
  source = "../../modules/permission-sets"
  name = each.value.name
    managed_policy_arns = each.value.managed_policy_arns
    custom_policy_names = each.value.custom_policy_names
  #  inline_policy = var.inline_policy   

}

module "account_permissions" {
  for_each = var.permission-sets
  source = "../../modules/account-permissions"
 account_assignments = each.value.account_assignments
  permission_set_arn = module.permission-sets[each.key].arn
}


# module account-permissions {
#   source = "../modules/account-permissions"
#   for_each = var.account_permission
#   # account_id = each.value.account_id
#   principal_type = each.value.principal_type
#   principal_id = each.value.principal_id
#   permission_set_arn = module.permission-sets.permission_set_arn
# }