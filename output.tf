output "elastic_job_name" {
  description = "Job name"
  value       = data.template_file.nomad_job_elastic.vars.elastic_job_name
}