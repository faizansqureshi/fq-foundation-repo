data "aws_iam_policy_document" "lb_read" {
  source_policy_documents = [file("${path.module}/lb/lb-read.json")]
                   
}
data "aws_iam_policy_document" "lb_write" {
  source_policy_documents = [file("${path.module}/lb/lb-write.json")]
                   
}
data "aws_iam_policy_document" "lb_run" {
  source_policy_documents = [file("${path.module}/lb/lb-run.json")]
                   
}
data "aws_iam_policy_document" "lb_operate" {
  source_policy_documents = [file("${path.module}/lb/lb-operate.json")]
                   
}


#IAM POLICIES

resource "aws_iam_policy" "loadbalancer_read" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-loadbalancer-read"
  description = "The loadbalancer read policy, to be used SDLC tooling in deploy policies"
  policy      = data.aws_iam_policy_document.lb_read.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

resource "aws_iam_policy" "loadbalancer_write" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-loadbalancer-write"
  description = "The loadbalancer write policy, to be used SDLC tooling in deploy policies"
  policy      = data.aws_iam_policy_document.lb_write.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}


resource "aws_iam_policy" "loadbalancer_run" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-loadbalancer-run"
  description = "The loadbalancer run policy, to be used in permission boundaries for supporting runtime IAM role restrictions for loadbalancer"
  policy      = data.aws_iam_policy_document.lb_run.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

resource "aws_iam_policy" "loadbalancer_operate" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-loadbalancer-operate"
  description = "The loadbalancer operate policy, to be used by humans for supporting loadbalancer deployments"
  policy      = data.aws_iam_policy_document.lb_operate.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

#output

output "loadbalancer_read_policy_arn" {
  value = try(aws_iam_policy.loadbalancer_read[0].arn, null)
}

output "loadbalancer_write_policy_arn" {
  value = try(aws_iam_policy.loadbalancer_write[0].arn, null)
}

output "loadbalancer_run_policy_arn" {
  value = try(aws_iam_policy.loadbalancer_run[0].arn, null)
}

output "loadbalancer_operate_policy_arn" {
  value = try(aws_iam_policy.loadbalancer_operate[0].arn, null)
}

output "loadbalancer_read_policy_json" {
  value = data.aws_iam_policy_document.lb_read.json
}

output "loadbalancer_write_policy_json" {
  value = data.aws_iam_policy_document.lb_write.json
}

output "loadbalancer_run_policy_json" {
  value = data.aws_iam_policy_document.lb_run.json
}

output "loadbalancer_operate_policy_json" {
  value = data.aws_iam_policy_document.lb_operate.json
}