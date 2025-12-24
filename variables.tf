variable "name" {
  type        = string
  description = "Base name for resources."
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for load balancer and security groups."
}

variable "subnets" {
  type        = list(string)
  description = "Subnets for the load balancer (typically public)."
}

variable "private_subnets" {
  type        = list(string)
  description = "Subnets for the ECS service (typically private)."
}

variable "create_cluster" {
  type        = bool
  default     = false
  description = "Whether to create a new ECS cluster."
}

variable "cluster_arn" {
  type        = string
  default     = null
  description = "Existing ECS cluster ARN when create_cluster is false."
}

variable "container_image" {
  type        = string
  description = "Container image to deploy."
}

variable "container_port" {
  type        = number
  default     = 80
  description = "Port the container listens on."
}

variable "desired_count" {
  type        = number
  default     = 1
  description = "Number of tasks to run."
}

variable "cpu" {
  type        = number
  default     = 256
  description = "Task CPU units."
}

variable "memory" {
  type        = number
  default     = 512
  description = "Task memory (MiB)."
}

variable "assign_public_ip" {
  type        = bool
  default     = false
  description = "Assign a public IP to the task ENI."
}

variable "environment" {
  type        = map(string)
  default     = {}
  description = "Environment variables for the container."
}

variable "secrets" {
  type        = map(string)
  default     = {}
  description = "Map of secrets (SSM or Secrets Manager ARNs) to expose as env vars."
}

variable "certificate_arn" {
  type        = string
  default     = null
  description = "ACM certificate ARN to enable HTTPS."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to resources."
}

variable "enable_autoscaling" {
  type        = bool
  default     = false
  description = "Enable ECS service autoscaling."
}

variable "autoscaling_min_capacity" {
  type        = number
  default     = 1
  description = "Minimum number of tasks for autoscaling."
}

variable "autoscaling_max_capacity" {
  type        = number
  default     = 3
  description = "Maximum number of tasks for autoscaling."
}

variable "autoscaling_cpu_target" {
  type        = number
  default     = 60
  description = "Target CPU utilization percentage for autoscaling."
}

variable "autoscaling_memory_target" {
  type        = number
  default     = 70
  description = "Target memory utilization percentage for autoscaling."
}
