data "aws_iam_policy_document" "ram_read" {
  source_policy_documents = [file("${path.root}./policies/ram/ram-read.json")]
}

data "aws_iam_policy_document" "ram_operate" {
  source_policy_documents = [file("${path.root}./policies/ram/ram-operate.json")]
}
data "aws_iam_policy_document" "ram_run" {
  source_policy_documents = [file("${path.root}./policies/ram/ram-run.json")]
}

data "aws_iam_policy_document" "ram_write" {
  source_policy_documents = [file("${path.root}./policies/ram/ram-write.json")]
}

resource "aws_iam_policy" "ram_read" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-ram-read"
  description = "The ram read policy, to be used SDLC tooling in deploy policies"
  policy      = data.aws_iam_policy_document.ram_read.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

resource "aws_iam_policy" "ram_operate" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-ram-operate"
  description = "The ram operate policy, to be used SDLC tooling in deploy policies"
  policy      = data.aws_iam_policy_document.ram_operate.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

resource "aws_iam_policy" "ram_write" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-ram-write"
  description = "The ram write policy, to be used SDLC tooling in deploy policies"
  policy      = data.aws_iam_policy_document.ram_write.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

resource "aws_iam_policy" "ram_run" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-ram-run"
  description = "The ram run policy, to be used SDLC tooling in deploy policies"
  policy      = data.aws_iam_policy_document.ram_run.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

output "ram_run_policy_arn" {
  value = try(aws_iam_policy.ram_run[0].arn, null)
}

output "ram_operate_policy_arn" {
  value = try(aws_iam_policy.ram_operate[0].arn, null)
}
output "ram_read_policy_arn" {
  value = try(aws_iam_policy.ram_read[0].arn, null)
}
output "ram_write_policy_arn" {
  value = try(aws_iam_policy.ram_write[0].arn, null)
}