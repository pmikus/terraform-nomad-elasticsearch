# Nomad
variable "nomad_datacenters" {
  description = "Nomad data centers"
  type        = list(string)
  default     = [ "dc1" ]
}

variable "nomad_host_volume" {
  description = "Nomad Host Volume"
  type        = string
  default     = "persistence"
}

# Elastic
variable "elastic_job_name" {
  description = "Job name"
  type        = string
  default     = "elastic"
}

variable "elastic_group_count" {
  description = "Number of group instances"
  type        = number
  default     = 1
}

variable "elastic_use_canary" {
  description = "Uses canary deployment for"
  type        = bool
  default     = false
}

variable "elastic_data_dir" {
  description = "DISK allocation"
  type        = string
  default     = "/data"
}

variable "elastic_use_host_volume" {
  description = "Use Nomad host volume feature"
  type        = bool
  default     = false
}

variable "elastic_vault_secret" {
  description = "Set of properties to be able to fetch secret from vault"
  type        = object({
    use_vault_provider        = bool,
    vault_kv_policy_name      = string,
    vault_kv_path             = string,
    vault_kv_field_access_key = string,
    vault_kv_field_secret_key = string
  })
}

variable "elastic_search_service_name" {
  description = "Service name"
  type        = string
  default     = "elastic"
}

variable "elastic_search_password" {
  description = "Password"
  type        = string
  default     = "Elastic1234"
}

variable "elastic_search_image" {
  description = "Docker image"
  type        = string
  default     = "docker.elastic.co/elasticsearch/elasticsearch:7.10.1"
}

variable "elastic_search_cpu" {
  description = "CPU allocation"
  type        = number
  default     = 40000
}

variable "elastic_search_memory" {
  description = "MEM allocation"
  type        = number
  default     = 40000
}

variable "elastic_search_rest_port" {
  description = "REST port allocation"
  type        = number
  default     = 9200
}

variable "elastic_search_transport_port" {
  description = "Transport port allocation"
  type        = number
  default     = 9300
}

# Kibana
variable "elastic_kibana_service_name" {
  description = "Service name"
  type        = string
  default     = "kibana"
}

variable "elastic_kibana_image" {
  description = "Docker image"
  type        = string
  default     = "docker.elastic.co/kibana/kibana:7.10.1"
}

variable "elastic_kibana_cpu" {
  description = "CPU allocation"
  type        = number
  default     = 1000
}

variable "elastic_kibana_memory" {
  description = "MEM allocation"
  type        = number
  default     = 8192
}

variable "elastic_kibana_port" {
  description = "HTTP port allocation"
  type        = number
  default     = 5601
}