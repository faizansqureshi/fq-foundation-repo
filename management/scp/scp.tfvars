region  = "eu-west-1"
profile = "AWSMGMT"



scps = {
    "scp-policy-1" = {
      name        = "My SCP Policy"
      description = "This SCP restricts certain actions."
      targets     = ["ou-in5e-rmym73jp", "ou-in5e-lz8tv9ci"] #accounts or OUs
      policy_file_name = "public-s3-deny"
    }
      "scp-policy-2" = {
        name        = "Deny MSK Deployments"
        description = "This SCP prevents MSK (Kafka) clusters and connectors from being created."
        targets     = ["ou-in5e-rmym73jp", "ou-in5e-lz8tv9ci"] #accounts or OUs
        policy_file_name = "msk-deny"
      }
}
