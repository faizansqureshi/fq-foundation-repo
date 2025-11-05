#module "workload" {
#source = "./modules/workloads"
# role_name = var.role_name
# github_repos = var.github_repos
# identifier = var.identifier
# policies = var.policies
 # taken from local policies and policies variable 
#}


module "workload" {
    for_each = var.workloads
source = "./modules/workloads"
create_policy_resources = each.value.create_policy_resources
 role_name = each.value.role_name
 github_repos = each.value.github_repos
 identifier = each.value.identifier
 policies = each.value.policies
# taken from local policies and policies variable 
}

module "permission-sets" {
  source = "./modules/permission-sets"
  name = var.name
  managed_policy_arns = var.managed_policy_arns
  custom_policy_names = var.custom_policy_names
  inline_policy = var.inline_policy   

}


