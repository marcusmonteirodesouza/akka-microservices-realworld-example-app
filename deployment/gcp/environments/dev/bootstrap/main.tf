module "bootstrap" {
  source = "../../../modules/bootstrap"

  project_id      = var.project_id
  org_id          = var.org_id
  billing_account = var.billing_account
  region          = var.region
  environment     = "dev"
}
