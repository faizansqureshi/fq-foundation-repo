module permission-sets {
  source = "../modules/permission-sets"
  name = var.name
    managed_policy_arns = var.managed_policy_arns
    custom_policy_names = var.custom_policy_names
    inline_policy = var.inline_policy   

}