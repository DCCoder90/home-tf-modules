output "host_connection" {
  description = "Connection details for host"
  value       = data.infisical_secrets.host_connections.secrets[var.service.host].value
  sensitive   = true
}