output "alb_dns_name" {
  value       = aws_lb.this.dns_name
  description = "DNS name of the application load balancer."
}

output "service_name" {
  value       = aws_ecs_service.this.name
  description = "Name of the ECS service."
}

output "task_definition_arn" {
  value       = aws_ecs_task_definition.this.arn
  description = "ARN of the task definition."
}

output "cluster_arn" {
  value       = local.cluster_arn
  description = "ARN of the ECS cluster in use."
}
