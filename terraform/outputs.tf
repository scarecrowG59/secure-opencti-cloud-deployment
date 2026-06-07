output "droplet_public_ip" {
  description = "Public IPv4 address of the OpenCTI droplet."
  value       = digitalocean_droplet.opencti.ipv4_address
}

output "ssh_command" {
  description = "Example SSH command."
  value       = "ssh dev@${digitalocean_droplet.opencti.ipv4_address}"
}

output "opencti_https_url_hint" {
  description = "Point your DNS A record to the droplet IP, then use this as the HTTPS entry point."
  value       = "https://<your-domain>"
}
