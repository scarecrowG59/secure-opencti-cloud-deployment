variable "do_token" {
  description = "DigitalOcean API token. Do not commit real values."
  type        = string
  sensitive   = true
}

variable "project_name" {
  description = "Project name used for resource naming and tags."
  type        = string
  default     = "secure-opencti"
}

variable "region" {
  description = "DigitalOcean region."
  type        = string
  default     = "sfo3"
}

variable "droplet_size" {
  description = "DigitalOcean droplet size."
  type        = string
  default     = "s-4vcpu-8gb"
}

variable "droplet_image" {
  description = "Droplet OS image."
  type        = string
  default     = "ubuntu-22-04-x64"
}

variable "ssh_key_name" {
  description = "Name of an existing DigitalOcean SSH key to attach to the droplet."
  type        = string
}

variable "admin_allowed_ipv4" {
  description = "Administrator public IPv4 CIDR allowed to access SSH, for example 1.2.3.4/32."
  type        = string
}

variable "enable_http_https" {
  description = "Whether to open HTTP and HTTPS for Caddy reverse proxy."
  type        = bool
  default     = true
}
