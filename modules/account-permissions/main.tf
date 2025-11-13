
# resource "aws_ssoadmin_account_assignment" "example_user_assignment" {
#   count = length(var.account_ids)
#   instance_arn       = local.instance_store_arn
#   permission_set_arn = var.permission_set_arn
#   principal_type     = var.principal_type                   # or "GROUP"
#   principal_id       = var.user_principal_id  # retrieved from identity store
#   target_id          = var.account_ids[count.index]
#   target_type        = "AWS_ACCOUNT"
# }


resource "aws_ssoadmin_account_assignment" "example_user_assignment" {
  for_each = var.account_assignments
  instance_arn       = local.instance_store_arn
  permission_set_arn = var.permission_set_arn
  principal_type     = each.value.principal_type                   # or "GROUP"
  principal_id       = each.value.principal_id  # retrieved from identity store
  target_id          = each.value.account_id
  target_type        = "AWS_ACCOUNT"
}
