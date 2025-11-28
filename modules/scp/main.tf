resource "aws_organizations_policy" "scp" {
	name        = var.name
	description = var.description
    #content json policy
	content     = var.content
	type        = "SERVICE_CONTROL_POLICY"
	tags        = var.tags
}

resource "aws_organizations_policy_attachment" "this" {
	for_each = toset(var.targets)
	policy_id = aws_organizations_policy.scp.id
	target_id = each.value
}


#SCP policy
# id and { account 1, acount 2....)