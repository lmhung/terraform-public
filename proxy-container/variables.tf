variable "remote" {
  description = "Incus remote server name"
  type        = string
}

variable "parent_iface" {
  description = "Macvlan parent network interface on the Incus host"
  type        = string
}

variable "container_ip" {
  description = "Static IP with prefix for proxy-container e.g. 192.168.100.99/24"
  type        = string
}

variable "gateway_ip" {
  description = "Default gateway IP"
  type        = string
}

variable "docker_host_ip" {
  description = "IP of docker-host for Caddy proxy targets"
  type        = string
}

variable "cloudflare_token" {
  description = "Cloudflare API token for ddclient"
  type        = string
  sensitive   = true
}