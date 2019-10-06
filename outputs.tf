output "auth_api_url" {
  value = "${module.auth_api.url}"
}

output "auth_api_methods" {
  value = "${module.auth_api.http_method}"
}

output "auth_lambda_name" {
  value = "${module.auth_lambda.name}"
}

output "auth_lambda_arn" {
  value = "${module.auth_lambda.arn}"
}

output "auth_lambda_role" {
  value = "${module.auth_lambda.role_name}"
}

output "auth_lambda_role_id" {
  value = "${module.auth_lambda.role_id}"
}
