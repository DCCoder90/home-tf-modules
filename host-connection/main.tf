data "infisical_projects" "home-net" {
  slug = var.system.infisical.project
}

data "infisical_secrets" "host_connections" {
  env_slug     = var.system.infisical.environment
  workspace_id = data.infisical_projects.home-net.id

  folder_path = var.system.infisical.host_connections
}