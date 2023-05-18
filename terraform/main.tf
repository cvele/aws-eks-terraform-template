provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source = "./modules/security_group"
}

module "alb" {
  source = "./modules/alb"
}

module "iam" {
  source = "./modules/iam"
}

module "eks" {
  source = "./modules/eks"
}

module "redis" {
  source = "./modules/redis"
}

module "s3" {
  source = "./modules/s3"
}

module "autoscaling" {
  source = "./modules/autoscaling"
}

module "acm" {
  source = "./modules/acm"
}
