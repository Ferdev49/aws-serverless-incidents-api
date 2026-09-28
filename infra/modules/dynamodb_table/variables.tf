variable "name" {
  description = "DynamoDB table name"
  type        = string
}

variable "hash_key" {
  description = "Partition key attribute name"
  type        = string
}

variable "attributes" {
  description = "Key attributes used by the table and its indexes (S, N or B)"
  type = list(object({
    name = string
    type = string
  }))

  validation {
    condition     = alltrue([for a in var.attributes : contains(["S", "N", "B"], a.type)])
    error_message = "Attribute type must be S, N or B."
  }
}

variable "global_secondary_indexes" {
  description = "GSIs to create; projection is ALL"
  type = list(object({
    name      = string
    hash_key  = string
    range_key = optional(string)
  }))
  default = []
}

variable "point_in_time_recovery" {
  description = "Enable continuous backups (PITR)"
  type        = bool
  default     = true
}

variable "deletion_protection" {
  description = "Prevent accidental table deletion"
  type        = bool
  default     = true
}
