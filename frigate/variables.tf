variable "remote" {
  description = "Incus remote server name"
  type        = string
}

variable "parent_iface" {
  description = "Macvlan parent network interface on the Incus host"
  type        = string
}

variable "mac_address" {
  description = "Fixed MAC address for stable DHCP reservation on router"
  type        = string
}

variable "gpu_pci" {
  description = "PCI address of the GPU to pass through e.g. 0000:00:02.0"
  type        = string
}

variable "cpu_limit" {
  description = "Number of vCPUs"
  type        = string
  default     = "1"
}

variable "memory_limit" {
  description = "Memory limit e.g. 2GiB"
  type        = string
  default     = "2GiB"
}

variable "recordings_source" {
  description = "Host path for Frigate recordings e.g. /media/hung/storage1tb/frigate-recordings"
  type        = string
}

variable "frigate_rtsp_password" {
  description = "FRIGATE_RTSP_PASSWORD env var"
  type        = string
  sensitive   = true
}

variable "proxy_auth_secret" {
  description = "Frigate proxy auth_secret"
  type        = string
  sensitive   = true
}

variable "rtsp_yoosee_password" {
  description = "RTSP password for Yoosee front camera"
  type        = string
  sensitive   = true
}

variable "rtsp_nha_bo_lam_1" {
  description = "RTSP password for Nha Bo Lam camera 1"
  type        = string
  sensitive   = true
}

variable "rtsp_nha_bo_lam_2" {
  description = "RTSP password for Nha Bo Lam camera 2"
  type        = string
  sensitive   = true
}