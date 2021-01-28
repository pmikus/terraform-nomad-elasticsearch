## Content
1. [Terraform-nomad-elasticksearch](#terraform-nomad-elasticksearch)
2. [Compatibility](#compatibility)
3. [Requirements](#requirements)
    1. [Required modules](#required-modules)
    2. [Required software](#required-software)
4. [Usage](#usage)
    1. [Verifying setup](#verifying-setup)
    2. [Providers](#providers)
5. [Example usage](#example-usage)
6. [Inputs](#inputs)
7. [Volumes](#volumes)
8. [Licence](#license)

# Terraform-nomad-elasticksearch

Terraform-nomad-elasticksearch module is IaC - infrastructure as code. Module contains a nomad job with [Elasticsearch](https://elastic.co).
- [consul](https://www.consul.io/docs/)
- [docker driver](https://www.nomadproject.io/docs/drivers/docker.html)

## Compatibility
| Software | OSS Version | Enterprise Version |
| :------- | :---------- | :-------- |
| Terraform | 0.13.0 or newer|  |
| Consul | 1.8.3 or newer | 1.8.3 or newer |
| Vault | 1.5.2.1 or newer | 1.5.2.1 or newer |
| Nomad | 0.12.3 or newer | 0.12.3 or newer |

## Requirements

### Required modules
No modules required.

### Required software
- [Consul](https://releases.hashicorp.com/consul/) binary available on `PATH` on the local machine.

## Usage
The following command will run an Elastic module.
```text
terraform init
terraform plan
terraform apply
```
### Verifying setup
You can verify that Elastic ran successful by checking the Elastic Kibana UI [localhost:3000/](http://localhost:3000/).

### Providers
- [Nomad](https://registry.terraform.io/providers/hashicorp/nomad/latest/docs)

## Example usage
These are the default values for the Elastic module.

```hcl
module "elastic" {
  source = "../.."

  # nomad
  nomad_datacenters               = ["dc1"]
  nomad_host_volume               = "persistence"

  # elastic
  job_name                        = "prod_elastic"
  service_name                    = "elastic"
  host                            = "127.0.0.1"
  port                            = 9200
  version                         = "7.10.1"
  vault_secret                    = {
                                      use_vault_provider        = true,
                                      vault_kv_policy_name      = "kv-secret",
                                      vault_kv_path             = "secret/data/elastic",
                                      vault_kv_field_access_key = "access_key",
                                      vault_kv_field_secret_key = "secret_key"
                                    }
  use_host_volume                 = true
  use_canary                      = true 
}
```

## Volumes
Module is using [host volume](https://www.nomadproject.io/docs/job-specification/volume) to store Elastic data.

## License
This work licensed under MIT License. See [LICENSE](./LICENSE) for full details.
