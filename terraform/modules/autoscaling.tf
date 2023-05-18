data "aws_iam_policy_document" "worker_autoscaling" {
  statement {
    effect = "Allow"
    actions = [
      "autoscaling:DescribeAutoScalingGroups",
      "autoscaling:DescribeAutoScalingInstances",
      "autoscaling:DescribeLaunchConfigurations",
      "autoscaling:DescribeTags",
      "autoscaling:SetDesiredCapacity",
      "autoscaling:TerminateInstanceInAutoScalingGroup",
      "ec2:DescribeLaunchTemplateVersions",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "worker_autoscaling" {
  name   = "worker_autoscaling"
  role   = module.eks.worker_iam_role_name
  policy = data.aws_iam_policy_document.worker_autoscaling.json
}

resource "aws_autoscaling_policy" "worker_cpu" {
  name                   = "${var.eks_cluster_name}_cpu_utilization"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = module.eks.worker_autoscaling_group_names[0]
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value       = var.autoscaling_target_cpu_utilization
    scale_in_cooldown  = var.autoscaling_scale_in_cooldown
    scale_out_cooldown = var.autoscaling_scale_out_cooldown
  }
}

# resource "aws_autoscaling_policy" "worker_mem" {
#   name                   = "${var.eks_cluster_name}_mem_utilization"
#   policy_type            = "TargetTrackingScaling"
#   autoscaling_group_name = module.eks.worker_autoscaling_group_names[0]
#   target_tracking_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "ASGAverageMemoryUtilization"
#     }
#     target_value       = var.autoscaling_target_memory_utilization
#     scale_in_cooldown  = var.autoscaling_scale_in_cooldown
#     scale_out_cooldown = var.autoscaling_scale_out_cooldown
#   }
# }
