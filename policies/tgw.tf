data "aws_iam_policy_document" "tgw_read" {
  source_policy_documents = [file("${path.root}./policies/tgw/tgw-read.json")]
}

data "aws_iam_policy_document" "tgw_operate" {
  source_policy_documents = [file("${path.root}./policies/tgw/tgw-operate.json")]
}
data "aws_iam_policy_document" "tgw_run" {
  source_policy_documents = [file("${path.root}./policies/tgw/tgw-run.json")]
}

data "aws_iam_policy_document" "tgw_write" {
  source_policy_documents = [file("${path.root}./policies/tgw/tgw-write.json")]
}

resource "aws_iam_policy" "tgw_read" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-tgw-read"
  description = "The tgw read policy, to be used SDLC tooling in deploy policies"
  policy      = data.aws_iam_policy_document.tgw_read.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

resource "aws_iam_policy" "tgw_operate" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-tgw-operate"
  description = "The tgw operate policy, to be used SDLC tooling in deploy policies"
  policy      = data.aws_iam_policy_document.tgw_operate.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

resource "aws_iam_policy" "tgw_write" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-tgw-write"
  description = "The tgw write policy, to be used SDLC tooling in deploy policies"
  policy      = data.aws_iam_policy_document.tgw_write.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

resource "aws_iam_policy" "tgw_run" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-tgw-run"
  description = "The tgw run policy, to be used SDLC tooling in deploy policies"
  policy      = data.aws_iam_policy_document.tgw_run.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

output "tgw_run_policy_arn" {
  value = try(aws_iam_policy.tgw_run[0].arn, null)
}

output "tgw_operate_policy_arn" {
  value = try(aws_iam_policy.tgw_operate[0].arn, null)
}
output "tgw_read_policy_arn" {
  value = try(aws_iam_policy.tgw_read[0].arn, null)
}
output "tgw_write_policy_arn" {
  value = try(aws_iam_policy.tgw_write[0].arn, null)
}