####################
# Tags
####################
variable "project" {
  description = "Project name for tags and resource naming"
  default = "flattireco"
}

variable "stage_name" {
  description = "The stage name(production/staging/etc..)"
  default = "dev"
}

variable "region" {
  description = "The AWS region, e.g., eu-west-1"
  default = "us-east-1"
}

variable "access_key" {
  description = "provider access key"
}

variable "secret_key" {
  description = "provider secret key"
}

####################
# Lambda
####################
variable "lambda_name" {
  description = "The name of the lambda function"
  default = "flattireco_auth"
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

variable lightspeed_client_id {
  description = "client id for lightspeed api"
}

variable lightspeed_client_secret {
  description = "client secret for lightspeed api"
}

####################
# API Gateway
####################
variable "binary_type" {
  description = "The list of binary media types supported by the RestApi"
  type        = "list"
  default     = ["*/*"]
}

variable "minimum_compression_size" {
  description = "The minimum response size to compress for the REST API"
  default     = 0
}

variable "method" {
  description = "The HTTP method for the REST API"
  default     = "ANY"
}
