data "dotenv" "dev_config" {
  filename = "../.env"
}

locals {
  env          = data.dotenv.dev_config.env
  project_name = try(local.env.PROJECT_NAME, "serverless-websocket-nest")
  region       = try(local.env.REGION, "ap-northeast-2")
}

output "dotenv" {
  value = local.env
}