variable "lambda_name" {
  description = "The name of the lambda function"
  default = "flattireco_ls_authorization"
}

variable "project" {
  description = "project name"
}

variable "stage_name" {
  description = "stage name"
}

variable "lambda_runtime" {
  description = "The runtime of the lambda function"
  default = "go1.x"
}

variable "lambda_memory" {
  description = "The memory size of the lambda function"
  default     = 128
}

variable "lambda_timeout" {
  description = "The timeout of the lambda function"
  default     = 3
}

variable "lambda_package" {
  description = "The package file name"
  default     = "function.zip"
}

variable "lambda_handler" {
  description = "The handler name of the lambda function"
  default = "main"
}

variable "lambda_env" {
  description = "The list of environment variables"
  type        = "map"
  default     = {}
}

variable "lambda_tags" {
  description = "Tags used for the AWS Lambda resources"
  type        = "map"
  default     = {}
}

variable lambda_security_group_ids {
  description = "VPC security group IDs."
  default     = []
  type        = "list"
}

variable lambda_subnet_ids {
  description = "VPC subnet IDs."
  default     = []
  type        = "list"
}

variable auth_dynamo_arn {
  description = "auth table arn"
}

variable lightspeed_client_id {
  description = "client id for lightspeed api"
}

variable lightspeed_client_secret {
  description = "client secret for lightspeed api"
}
