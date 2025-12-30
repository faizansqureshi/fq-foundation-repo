#profile = "fq-dev"
#test
region = "eu-west-1"


workloads = {
 nw_foundation = { 
    create_policy_resources = true
    role_name = "dev_foundation_role"
github_repos = ["repo:faizansqureshi/fq-foundation-repo:*"]
identifier = ["arn:aws:iam::963374505049:oidc-provider/token.actions.githubusercontent.com"]
policies = ["fq-ec2-run","fq-ec2-read","fq-loadbalancer-write"]
},
 compute_role = { 
    create_policy_resources = false
    role_name = "dev_compute_role"
github_repos = ["repo:faizansqureshi/fq-foundation-repo:*"]
identifier = ["arn:aws:iam::963374505049:oidc-provider/token.actions.githubusercontent.com"]
policies = ["fq-ec2-run","fq-ec2-read","fq-ec2-write"]
}}

