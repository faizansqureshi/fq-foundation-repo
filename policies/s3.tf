# Everything for AWS service 's3' in one file

####################
# data section
####################

data "aws_iam_policy_document" "s3_read" {
  source_policy_documents = [file("${path.module}/s3/s3-read.json")]
                   }

data "aws_iam_policy_document" "s3_write" {
source_policy_documents = [ file("${path.module}/s3/s3-write.json")]  
}
data "aws_iam_policy_document" "s3_run" {
  source_policy_documents = [file("${path.module}/s3/s3-run.json")]
                   
}
data "aws_iam_policy_document" "s3_operate" {
  source_policy_documents = [file("${path.module}/s3/s3-operate.json")]
                   
}


####################
# IAM Policies
####################

resource "aws_iam_policy" "s3_read" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-s3-read"
  description = "The s3 read policy, to be used SDLC tooling in deploy policies"
  policy      = data.aws_iam_policy_document.s3_read.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

resource "aws_iam_policy" "s3_write" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-s3-write"
  description = "The s3 write policy, to be used SDLC tooling in deploy policies"
  policy      = data.aws_iam_policy_document.s3_write.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

resource "aws_iam_policy" "s3_run" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-s3-run"
  description = "The s3 run policy, to be used in permission boundaries for supporting runtime IAM role restrictions for s3"
  policy      = data.aws_iam_policy_document.s3_run.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

resource "aws_iam_policy" "s3_operate" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-s3-operate"
  description = "The s3 operate policy, to be used by humans for supporting s3 deployments"
  policy      = data.aws_iam_policy_document.s3_operate.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

####################
# Outputs
####################

output "s3_read_policy_arn" {
  value = try(aws_iam_policy.s3_read[0].arn, null)
}

output "s3_write_policy_arn" {
  value = try(aws_iam_policy.s3_write[0].arn, null)
}

output "s3_run_policy_arn" {
  value = try(aws_iam_policy.s3_run[0].arn, null)
}

output "s3_operate_policy_arn" {
  value = try(aws_iam_policy.s3_operate[0].arn, null)
}

output "s3_read_policy_json" {
  value = data.aws_iam_policy_document.s3_read.json
}

output "s3_write_policy_json" {
  value = data.aws_iam_policy_document.s3_write.json
}

output "s3_run_policy_json" {
  value = data.aws_iam_policy_document.s3_run.json
}

output "s3_operate_policy_json" {
  value = data.aws_iam_policy_document.s3_operate.json
}