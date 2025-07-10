data "infisical_projects" "home-net" {
  # This assumes a constant project slug. Consider making this configurable
  # via var.system if it needs to be more dynamic.
  slug = "home-net-ln-sy"
}

module "custom_network" {
  count  = length(local.creatable_networks) > 0 ? 1 : 0
  source = "../docker-network"

  networks = local.creatable_networks
}

module "service_container" {
  for_each = var.stack.services
  source   = "../docker-service"

  service = merge(each.value, { host = var.stack.host })
  system  = var.system

  /*
Still need to combine environment, mounts, and networks!
  */
}
