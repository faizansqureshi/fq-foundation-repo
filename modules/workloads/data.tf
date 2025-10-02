#trust policy this is just the read trust policy nothing created can attach it to any role

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "github_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = var.github_repos
    }

    principals {
      type        = "Federated"
      identifiers = var.identifier
      #["arn:aws:iam::963374505049:oidc-provider/token.actions.githubusercontent.com"]
    }
  }

}
# federation is for each account 

#      identifiers = ["arn:aws:iam::865712988430:oidc-provider/token.actions.githubusercontent.com"]
