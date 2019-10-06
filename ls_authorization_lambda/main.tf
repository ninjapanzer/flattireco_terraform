####################
# LS Authorization Lambda
####################
module "ls_authorization_lambda" {
  source             = "../modules/lambda"
  name               = "${var.project}-${var.lambda_name}-${var.stage_name}"
  handler            = "main"
  runtime            = "${var.lambda_runtime}"
  memory             = "${var.lambda_memory}"
  timeout            = "${var.lambda_timeout}"
  package            = "./ls_authorization_lambda/function.zip"
  tags               = "${var.lambda_tags}"
  security_group_ids = "${var.lambda_security_group_ids}"
  subnet_ids         = "${var.lambda_subnet_ids}"
  env = {
    lightspeed_client_id = "${var.lightspeed_client_id}"
    lightspeed_client_secret = "${var.lightspeed_client_secret}"
  }
}

resource "aws_iam_role_policy" "iam_for_auth_table" {
  name = "iam_for_${module.ls_authorization_lambda.role_name}_auth_table"
  role = "${module.ls_authorization_lambda.role_id}"

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

#{
#    "Version": "2012-10-17",
#    "Statement": [
#        {
#            "Sid": "AllowAuroraToExampleFunction",
#            "Effect": "Allow",
#            "Action": "lambda:InvokeFunction",
#            "Resource": "arn:aws:lambda:<region>:<123456789012>:function:<example_function>"
#        }
#    ]
#}