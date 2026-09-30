# Terraform — Oracle Cloud Minecraft Server

Provisions a full Oracle Cloud stack (VCN, subnet, security list, compute instance) and injects the setup script automatically on first boot.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) installed
- OCI API key configured at `~/.oci/config` with profile `DEFAULT`

## Usage

```bash
# 1. Fill in your values
cp terraform.tfvars.example terraform.tfvars  # or edit terraform.tfvars directly

# 2. Initialise
terraform init

# 3. Preview changes
terraform plan

# 4. Deploy
terraform apply
```

After apply, the instance public IP and SSH key path are printed as outputs.

**SSH into the server:**

```bash
ssh -i minecraft_server.pem opc@<instance_public_ip>
```

## Variables

Fill these in `terraform.tfvars` before running.

| Variable              | Required | Default     | Description                                      |
| --------------------- | -------- | ----------- | ------------------------------------------------ |
| `region`              | ✅       | —           | OCI region (e.g. `uk-london-1`)                  |
| `compartment_id`      | ✅       | —           | OCID of your compartment                         |
| `instance_image_ocid` | ✅       | —           | OCID of Oracle Linux 9 ARM image for your region |
| `oci_config_profile`  | ❌       | `"DEFAULT"` | OCI config file profile to use                   |

> Find `instance_image_ocid` at: **Compute → Images → Platform Images → Oracle Linux 9 → Ampere**

## Tear Down

```bash
terraform destroy
```
