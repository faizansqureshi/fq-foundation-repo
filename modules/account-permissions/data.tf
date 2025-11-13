data "aws_ssoadmin_instances" "identity" {}

# converting the output into the list instead of map, to take the first value of array
locals {
   instance_store_arn = tolist(data.aws_ssoadmin_instances.identity.arns)[0]
  instance_store_id  = tolist(data.aws_ssoadmin_instances.identity.identity_store_ids)[0]
}