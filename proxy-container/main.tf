resource "incus_instance" "proxy_container" {
  name   = "proxy-container"
  image  = "images:debian/13/cloud"
  remote = var.remote
  type   = "container"

  config = {
    "boot.autostart"       = "true"
    "limits.cpu"           = "1"
    "limits.memory"        = "2GiB"
    "cloud-init.user-data" = templatefile("${path.module}/cloud-init-proxy.yaml", {
      container_ip     = var.container_ip
      gateway_ip       = var.gateway_ip
      docker_host_ip   = var.docker_host_ip
      cloudflare_token = var.cloudflare_token
    })
  }

  device {
    name = "root"
    type = "disk"
    properties = {
      path = "/"
      pool = "default"
    }
  }

  device {
    name = "eth0"
    type = "nic"
    properties = {
      name    = "eth0"
      nictype = "macvlan"
      parent  = var.parent_iface
    }
  }
}