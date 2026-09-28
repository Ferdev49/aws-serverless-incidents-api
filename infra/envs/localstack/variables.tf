variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Prefix for resource names and Project tag"
  type        = string
  default     = "incidents-api"

  validation {
    condition     = can(regex("^[a-z0-9-]{3,30}$", var.project_name))
    error_message = "project_name must be 3-30 chars: lowercase letters, digits, hyphens."
  }
}

variable "environment" {
  description = "Deployment environment name"
  type        = string
  default     = "localstack"
}

variable "localstack_endpoint" {
  description = "LocalStack edge endpoint"
  type        = string
  default     = "http://localhost.localstack.cloud:4566"
}
