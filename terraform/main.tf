provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "admin" {
  name = var.ssh_key_name
}

resource "digitalocean_droplet" "opencti" {
  name     = "${var.project_name}-droplet"
  region   = var.region
  size     = var.droplet_size
  image    = var.droplet_image
  ssh_keys = [data.digitalocean_ssh_key.admin.id]

  tags = [
    var.project_name,
    "opencti",
    "cti",
    "capstone"
  ]

  monitoring = true
}

resource "digitalocean_firewall" "opencti" {
  name = "${var.project_name}-firewall"

  droplet_ids = [
    digitalocean_droplet.opencti.id
  ]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = [var.admin_allowed_ipv4]
  }

  dynamic "inbound_rule" {
    for_each = var.enable_http_https ? [1] : []
    content {
      protocol         = "tcp"
      port_range       = "80"
      source_addresses = ["0.0.0.0/0", "::/0"]
    }
  }

  dynamic "inbound_rule" {
    for_each = var.enable_http_https ? [1] : []
    content {
      protocol         = "tcp"
      port_range       = "443"
      source_addresses = ["0.0.0.0/0", "::/0"]
    }
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
