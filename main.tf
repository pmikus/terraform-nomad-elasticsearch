locals {
  datacenters = join(",", var.nomad_datacenters)
}

data "template_file" "nomad_job_elastic" {
  template    = file("${path.module}/conf/nomad/elastic.hcl")
  vars        = {
    job_name               = var.elastic_job_name
    datacenters            = local.datacenters
    use_canary             = var.elastic_use_canary
    group_count            = var.elastic_group_count
    use_host_volume        = var.elastic_use_host_volume
    host_volume            = var.nomad_host_volume
    data_dir               = var.elastic_data_dir
    search_image           = var.elastic_search_image
    search_service_name    = var.elastic_search_service_name
    search_password        = var.elastic_search_password
    search_cpu             = var.elastic_search_cpu
    search_memory          = var.elastic_search_memory
    search_rest_port       = var.elastic_search_rest_port
    search_transport_port  = var.elastic_search_transport_port
    kibana_image           = var.elastic_kibana_image
    kibana_service_name    = var.elastic_kibana_service_name
    kibana_cpu             = var.elastic_kibana_cpu
    kibana_memory          = var.elastic_kibana_memory
    kibana_port            = var.elastic_kibana_port
  }
}

resource "nomad_job" "nomad_job_elastic" {
  jobspec     = data.template_file.nomad_job_elastic.rendered
  detach      = false
}