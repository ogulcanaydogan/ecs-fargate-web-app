provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "web_app" {
  source = "../../"

  name             = "example-web-app"
  vpc_id           = data.aws_vpc.default.id
  subnets          = data.aws_subnets.default.ids
  private_subnets  = data.aws_subnets.default.ids
  container_image  = "nginx:latest"
  desired_count    = 1
  assign_public_ip = true
}
