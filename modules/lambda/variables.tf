variable "name" {
  description = "The name of the lambda function"
}

variable "runtime" {
  description = "The runtime of the lambda to create"
}

variable "memory" {
  description = "The memory size of the function"
  default     = 128
}

variable "timeout" {
  description = "The timeout of the function"
  default     = 3
}

variable "package" {
  description = "The package file name"
  default     = "function.zip"
}

variable "handler" {
  description = "The handler name of the lambda function"
}

variable "env" {
  description = "The list of environment variables"
  type        = "map"
}

variable "tags" {
  description = "Tags used for the AWS resources created by this template"
  type        = "map"
  default     = {}
}

variable security_group_ids {
  description = "VPC security group IDs."
  default     = []
  type        = "list"
}

variable subnet_ids {
  description = "VPC subnet IDs."
  default     = []
  type        = "list"
}

variable lightspeed_client_id {
  description = "client id for lightspeed api"
  default     = "missing"
}

variable lightspeed_client_secret {
  description = "client secret for lightspeed api"
  default     = "missing"
}
