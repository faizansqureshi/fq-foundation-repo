region  = "eu-west-1"
profile = "AWSMGMT"

name = "My SCP Policy"
description = "This SCP restricts certain actions."
targets = ["ou-abcdefgh", "ou-ijklmnop"] #accounts or OUs
policy_file_name = "restrictive_scp_policy"