terraform {
  backend "s3" {
    bucket       = "incidents-api-tfstate-000000000000-us-east-1"
    key          = "localstack/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true

    # LocalStack overrides
    endpoints = {
      s3  = "http://localhost.localstack.cloud:4566"
      sts = "http://localhost.localstack.cloud:4566"
    }
    use_path_style              = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
  }
}
