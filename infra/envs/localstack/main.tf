module "incidents_table" {
  source = "../../modules/dynamodb_table"

  name     = "${var.project_name}-incidents"
  hash_key = "id"
  attributes = [
    { name = "id", type = "S" },
    { name = "status", type = "S" },
    { name = "created_at", type = "S" },
  ]
  global_secondary_indexes = [
    { name = "status-index", hash_key = "status", range_key = "created_at" },
  ]
  deletion_protection = false
}
