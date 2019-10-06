####################
# Auth Lambda
####################
module "auth_lambda" {
  source             = "../modules/lambda"
  name               = "${var.project}-${var.lambda_name}-${var.stage_name}"
  handler            = "main"
  runtime            = "${var.lambda_runtime}"
  memory             = "${var.lambda_memory}"
  timeout            = "${var.lambda_timeout}"
  package            = "./function.zip"
  tags               = "${var.lambda_tags}"
  security_group_ids = "${var.lambda_security_group_ids}"
  subnet_ids         = "${var.lambda_subnet_ids}"
  env = {
    lightspeed_client_id = "${var.lightspeed_client_id}"
    lightspeed_client_secret = "${var.lightspeed_client_secret}"
  }
}

resource "aws_iam_role_policy" "iam_for_auth_table" {
  name = "iam_for_${module.auth_lambda.role_name}_auth_table"
  role = "${module.auth_lambda.role_id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [{
      "Effect": "Allow",
      "Action": [
        "dynamodb:BatchGetItem",
        "dynamodb:GetItem",
        "dynamodb:Query",
        "dynamodb:Scan",
        "dynamodb:BatchWriteItem",
        "dynamodb:PutItem",
        "dynamodb:UpdateItem"
      ],
      "Resource": "${var.auth_dynamo_arn}"
    }
  ]
}
EOF
}
