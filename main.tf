module "dev_workload" {
    source = "./modules/workloads"
 role_name = var.role_name
 github_repos = var.github_repos
 identifier = var.identifier
 policies = var.policies
 # taken from local policies and policies variable 
}




