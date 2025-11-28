output "permission_set_arns" {
  value = {for k in keys(var.permission-sets) : k => module.permission-sets[k].arn}
}