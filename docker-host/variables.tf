variable "remote" {
  description = "Incus remote server name"
  type        = string
}

variable "parent_iface" {
  description = "Macvlan parent network interface on the Incus host"
  type        = string
}

variable "container_ip" {
  description = "Static IP with prefix e.g. 192.168.100.45/24"
  type        = string
}

variable "gateway_ip" {
  description = "Default gateway IP"
  type        = string
}

variable "cpu_limit" {
  description = "Number of vCPUs"
  type        = string
  default     = "2"
}

variable "memory_limit" {
  description = "Memory limit e.g. 10GiB"
  type        = string
  default     = "10GiB"
}

variable "disk_size" {
  description = "Root disk size e.g. 10GiB"
  type        = string
  default     = "10GiB"
}

variable "storage_source" {
  description = "Host path for passthrough storage disk"
  type        = string
}

variable "storage_path" {
  description = "Mount path inside the VM for passthrough storage disk"
  type        = string
}