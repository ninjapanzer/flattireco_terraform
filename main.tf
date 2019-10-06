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
  name                     = "${var.project}-${module.auth_lambda.name}-${var.stage_name}"
  stage                    = "${var.stage_name}"
  method                   = "${var.method}"
  binary_type              = "${var.binary_type}"
  minimum_compression_size = "${var.minimum_compression_size}"
  lambda_arn               = "${module.auth_lambda.arn}"
  lambda_arn_invoke        = "${module.auth_lambda.arn_invoke}"
}

module "auth_lambda" {
  source = "./auth_lambda"
  lambda_name = "flattireco_auth"
  project = "${var.project}"
  stage_name = "${var.stage_name}"
  lightspeed_client_id = "${var.lightspeed_client_id}"
  lightspeed_client_secret = "${var.lightspeed_client_secret}"
  auth_dynamo_arn = "${module.auth_table.arn}"
}

module "auth_table" {
  source = "./modules/dynamodb/auth_table"
}
