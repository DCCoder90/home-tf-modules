data "infisical_projects" "home-net" {
  # This assumes a constant project slug. Consider making this configurable
  # via var.system if it needs to be more dynamic.
  slug = "home-net-ln-sy"
}

module "custom_network" {
  count  = length(local.creatable_networks) > 0 ? 1 : 0
  source = "git@github.com:DCCoder90/home-tf-modules.git//docker-network?ref=1.0.0"

  networks = local.creatable_networks
}

module "service_container" {
  for_each = var.stack.services
  source   = "git@github.com:DCCoder90/home-tf-modules.git//docker-service?ref=1.0.0"

  service = each.value
  system  = var.system

  /*
Still need to combine environment, mounts, and networks!
  */
}
