#consume the module role by using policies as input check "name"
# deploy the new role in same account two different roles one for test network role and owne for dev network role for the second role you dont haeve to redoply the polic that should
# be using the same polcieis deployed in firs role by giving count variable value false 


module "policies" {
  source = "../../policies"
}

module "role" {
  source             = "../roles"
  role_name          = "${var.role_name}"
  role_description   = "The role is for account deployment"
  role_assume_policy = data.aws_iam_policy_document.github_assume_role_policy.json
  role_managed_policy_arns = local.policies_arns
depends_on = [ module.policies ]
}

