resource "aws_ssoadmin_permission_set" "permission_set" {
  name         = var.name
  description  = "Permission set for App engineers to have elevated permissions"
  instance_arn = local.instance_store_arn
}


#attach the managed policies to permission sets 
resource "aws_ssoadmin_managed_policy_attachment" "managed_policy" {
count = length(var.managed_policy_arns)
  instance_arn       = local.instance_store_arn
  managed_policy_arn = var.managed_policy_arns[count.index]
  permission_set_arn = aws_ssoadmin_permission_set.permission_set.arn
}


resource "aws_ssoadmin_permission_set_inline_policy" "inline_policy" {
  count = var.inline_policy == null ? 0 : 1
  inline_policy      = var.inline_policy
  instance_arn       = local.instance_store_arn
  permission_set_arn = aws_ssoadmin_permission_set.permission_set.arn
}


resource "aws_ssoadmin_customer_managed_policy_attachment" "custom_policy" {
  count = length(var.custom_policy_names)
  instance_arn = local.instance_store_arn
  customer_managed_policy_reference {
    name = var.custom_policy_names[count.index]
  }
  permission_set_arn = aws_ssoadmin_permission_set.permission_set.arn
}

