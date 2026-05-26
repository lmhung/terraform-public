terraform {
  required_providers {
    incus = {
      source = "lxc/incus"
    }
  }
}

provider "incus" {
}

resource "incus_instance" "frigate" {
  name   = "frigate"
  image  = "images:debian/13/cloud"
  remote = var.remote
  type   = "container"

  config = {
    "boot.autostart"       = "true"
    "limits.cpu"           = var.cpu_limit
    "limits.memory"        = var.memory_limit
    "security.nesting"     = "true"
    "cloud-init.user-data" = templatefile("${path.module}/cloud-init.yaml", {
      frigate_rtsp_password = var.frigate_rtsp_password
      proxy_auth_secret     = var.proxy_auth_secret
      rtsp_yoosee_password  = var.rtsp_yoosee_password
      rtsp_nha_bo_lam_1     = var.rtsp_nha_bo_lam_1
      rtsp_nha_bo_lam_2     = var.rtsp_nha_bo_lam_2
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
      hwaddr  = var.mac_address
    }
  }

  device {
    name = "gpu"
    type = "gpu"
    properties = {
      gputype = "physical"
      pci     = var.gpu_pci
    }
  }

  device {
    name = "recordings"
    type = "disk"
    properties = {
      source = var.recordings_source
      path   = "/srv/recordings"
    }
  }
}