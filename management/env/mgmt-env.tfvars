region  = "eu-west-1"
profile = "AWSMGMT"

permission-sets = {
  "mgmt-permission-set" = {
    name = "mgmt-permission-set"
    managed_policy_arns = [
      "arn:aws:iam::aws:policy/AdministratorAccess",
      "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
    ]
  
    custom_policy_names = []
    # inline_policy = {}

    account_assignments = {
      "fq-dev": {
        principal_type = "USER"
        principal_id   = "c23514f4-f0b1-70e6-468d-3d458814ffc0"
        account_id     = "963374505049"
      },
            "fq-network": {
        principal_type = "GROUP"
        principal_id   = "22252494-1031-708e-d79c-40bed9c927e3"
        account_id     = "865712988430"
      }
    }
  },
  "mgmt-readonly-permission-set" = {
    name = "mgmt-readonly-permission-set"
    managed_policy_arns = [
      "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
    ]
    custom_policy_names = []
    # inline_policy = {}
account_assignments ={}

  },
  "mgmt-readonly-permission-set-2" = {
    name = "mgmt-readonly-permission-set-2"
    managed_policy_arns = [
      "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
    ]
    custom_policy_names = []
    # inline_policy = {}
    account_assignments ={}
  }
}



# account_permission = {
#   "account_a":{
#     account_id = "111122223333"
#     principal_type = "USER"
#     principal_id = "d-90670a3e1e#faizan.ahmad"  
#     permission = ["ec2_operate","s3_readonly"]
#     managed_policy_arns = [
#       "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
#     ]
#   },
#   "account_a_1":{
#     account_id = "111122223333"
#     principal_type = "USER"
#     principal_id = "d-90670a3e1e#faizan.ahmad"  
#     permission = ["admin","s3_readonly"]
#     managed_policy_arns = [
#       "arn:aws:iam::aws:policy/AdministratorAccess",
#       "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
#     ]
#   }
# }
