variable "aws_region" {
  description = "The region where the AWS resources will be created"
  default     = "eu-central-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "alb_name" {
  description = "The name of the Application Load Balancer"
  default     = "my-alb"
}

variable "domain_name" {
  description = "The domain name for the ACM certificate and service"
  default     = "example.com"
}

variable "subdomain" {
  description = "The subdomain"
  default     = "www"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  default     = "my-cluster"
}

variable "node_group_name" {
  description = "Name label to tag the worker node group with"
  default     = "worker-nodes"
}

variable "redis_cluster_id" {
  description = "The ID of the Elasticache Redis cluster"
  default     = "my-redis-cluster"
}

variable "bucket_name" {
  description = "The name of the S3 bucket to create"
  default     = "my-bucket"
}

variable "autoscaling_target_cpu_utilization" {
  description = "Target CPU utilization for the autoscaling policy"
  default     = 80
}

variable "autoscaling_target_memory_utilization" {
  description = "Target memory utilization for the autoscaling policy"
  default     = 80
}

variable "autoscaling_scale_in_cooldown" {
  description = "The amount of time, in seconds, after a scale in activity completes before another scale in activity can start"
  default     = 300
}

variable "autoscaling_scale_out_cooldown" {
  description = "The amount of time, in seconds, after a scale out activity completes before another scale out activity can start"
  default     = 300
}

variable "cluster_version" {
  description = "Kubernetes version to use for the EKS cluster"
  default     = "1.21"
}

variable "desired_capacity" {
  description = "Desired number of worker nodes in the EKS cluster"
  default     = 2
}

variable "min_capacity" {
  description = "Minimum number of worker nodes in the EKS cluster"
  default     = 1
}

variable "max_capacity" {
  description = "Maximum number of worker nodes in the EKS cluster"
  default     = 3
}

variable "instance_type" {
  description = "Instance type to use for worker nodes"
  default     = "t2.micro"
}

variable "environment" {
  description = "Environment label to tag resources with"
  default     = "dev"
}

variable "redis_node_type" {
  description = "Instance type to use for Elasticache Redis nodes"
  default     = "cache.t2.micro"
}

variable "redis_nodes" {
  description = "Number of nodes in the Elasticache Redis replication group"
  default     = 1
}

variable "container_image" {
  description = "The Docker image to run in the EKS cluster"
}
