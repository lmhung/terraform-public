# terraform

Terraform configurations for managing [Incus](https://linuxcontainers.org/incus/) containers and VMs on a self-hosted homelab.

## Modules

| Module | Type | Description |
|--------|------|-------------|
| `docker-host` | VM (macvlan) | Main Docker host VM with bridged LAN networking |
| `frigate` | LXC container | Frigate NVR with Intel GPU passthrough |
| `proxy-container` | LXC container | Caddy layer-4 reverse proxy + ddclient for Cloudflare DDNS |

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) ≥ 1.0
- [Incus](https://linuxcontainers.org/incus/docs/main/) with a configured remote
- The [lxc/incus](https://registry.terraform.io/providers/lxc/incus/latest) Terraform provider

## Usage

Each module is independent. To deploy one:

```bash
cd <module>
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values
terraform init
terraform plan
terraform apply
```

## Secrets

`terraform.tfvars` files are **gitignored**. Each module includes a `terraform.tfvars.example`
with all required variables. Copy it, fill in real values, and **never commit the real file**.

Variables marked `sensitive = true` in `variables.tf` (passwords, API tokens, WireGuard keys)
must be supplied at apply time either via `terraform.tfvars` or environment variables
(`TF_VAR_<name>`).

## License

MIT
