terraform {
  required_providers {
    incus = {
      source = "lxc/incus"
    }
  }
}

provider "incus" {
}

resource "incus_instance" "docker_host" {
  name   = "docker-host"
  image  = "images:debian/13/cloud"
  remote = var.remote
  type   = "virtual-machine"

  config = {
    "boot.autostart"       = "true"
    "limits.cpu"           = var.cpu_limit
    "limits.memory"        = var.memory_limit
    "cloud-init.user-data" = templatefile("${path.module}/cloud-init.yaml", {
      container_ip = var.container_ip
      gateway_ip   = var.gateway_ip
    })
  }

  device {
    name = "root"
    type = "disk"
    properties = {
      path = "/"
      pool = "default"
      size = var.disk_size
    }
  }

  device {
    name = "storage"
    type = "disk"
    properties = {
      source = var.storage_source
      path   = var.storage_path
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