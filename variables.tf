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
  description = "Elastic job name"
  type        = string
  default     = "elastic"
}

variable "elastic_group_count" {
  description = "Number of elastic group instances"
  type        = number
  default     = 1
}

variable "elastic_use_canary" {
  description = "Uses canary deployment for elastic"
  type        = bool
  default     = false
}

variable "elastic_data_dir" {
  description = "Elastic DISK allocation"
  type        = string
  default     = "/data"
}

variable "elastic_use_host_volume" {
  description = "Use Nomad host volume feature"
  type        = bool
  default     = false
}

variable "elastic_cluster_service_name" {
  description = "Elastic cluster service name"
  type        = string
  default     = "elastic"
}

variable "elastic_cluster_password" {
  description = "Elastic cluster password"
  type        = string
  default     = "Elastic1234"
}

variable "elastic_cluster_image" {
  description = "Elastic cluster Docker image"
  type        = string
  default     = "docker.elastic.co/elasticsearch/elasticsearch:7.10.1"
}

variable "elastic_cluster_cpu" {
  description = "Elastic cluster group CPU"
  type        = number
  default     = 40000
}

variable "elastic_cluster_memory" {
  description = "Elastic cluster group memory"
  type        = number
  default     = 40000
}

variable "elastic_cluster_rest_port" {
  description = "Elastic cluster REST port"
  type        = number
  default     = 9200
}

variable "elastic_cluster_transport_port" {
  description = "Elastic cluster Transport port"
  type        = number
  default     = 9300
}

# Kibana
variable "elastic_kibana_service_name" {
  description = "Elastic Kibana service name"
  type        = string
  default     = "kibana"
}

variable "elastic_cluster_image" {
  description = "Elastic Kibana Docker image"
  type        = string
  default     = "docker.elastic.co/kibana/kibana:7.10.1"
}

variable "elastic_kibana_cpu" {
  description = "Elastic Kibana group CPU"
  type        = number
  default     = 1000
}

variable "elastic_kibana_memory" {
  description = "Elastic Kibana group memory"
  type        = number
  default     = 8192
}

variable "elastic_kibana_port" {
  description = "Elastic Kibana HTTP port"
  type        = number
  default     = 5601
}