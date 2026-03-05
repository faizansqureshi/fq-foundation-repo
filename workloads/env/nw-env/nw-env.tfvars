#working on this config 
#profile = "fq-personal-network"
region = "eu-west-1"

workloads = {
 nw_plan_role = { 
    create_policy_resources = false
    role_name = "nw_foundation_role_plan"
github_repos = ["repo:faizansqureshi/fq-foundation-repo:*"]
identifier = ["arn:aws:iam::865712988430:oidc-provider/token.actions.githubusercontent.com"]
policies = ["fq-vpc-read"]
},
 nw_deploy_role = { 
    create_policy_resources = false
    role_name = "nw_foundation_role_deploy"
github_repos = ["repo:faizansqureshi/fq-foundation-repo:*"]
identifier = ["arn:aws:iam::865712988430:oidc-provider/token.actions.githubusercontent.com"]
policies = ["fq-vpc-write"]
}}