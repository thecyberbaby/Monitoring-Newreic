provider "newrelic" {
  account_id = var.account_id
  api_key    = var.nr_api_key
  region     = var.nr_region
}