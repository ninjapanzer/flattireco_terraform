terraform {
  required_version = "~>0.12"
}

provider "aws" {
  region  = "${var.region}"
  version = "~> 2.7.0"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "flattireco"

    workspaces {
      name = "flattireco_terraform"
    }
  }
}

####################
# Auth Lambda API Gateway
####################≈
module "auth_api" {
  source                   = "./modules/apigw"
  name                     = "${var.project}-${var.lambda_name}-${var.stage_name}"
  stage                    = "${var.stage_name}"
  method                   = "${var.method}"
  binary_type              = "${var.binary_type}"
  minimum_compression_size = "${var.minimum_compression_size}"
  lambda_arn               = "${module.auth_lambda.arn}"
  lambda_arn_invoke        = "${module.auth_lambda.arn_invoke}"
}

####################
# Auth Lambda
####################
module "auth_lambda" {
  source             = "./modules/lambda"
  name               = "${var.project}-${var.lambda_name}-${var.stage_name}"
  handler            = "main"
  runtime            = "${var.lambda_runtime}"
  memory             = "${var.lambda_memory}"
  timeout            = "${var.lambda_timeout}"
  package            = "auth_lambda/function.zip"
  tags               = "${var.lambda_tags}"
  security_group_ids = "${var.lambda_security_group_ids}"
  subnet_ids         = "${var.lambda_subnet_ids}"
  env = {
    lightspeed_client_id = "${var.lightspeed_client_id}"
    lightspeed_client_secret = "${var.lightspeed_client_secret}"
  }
}
