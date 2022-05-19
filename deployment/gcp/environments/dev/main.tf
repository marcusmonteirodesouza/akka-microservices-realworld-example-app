module "network" {
  source = "../../modules/network"

  project_id = data.terraform_remote_state.bootstrap.outputs.project_id
}
