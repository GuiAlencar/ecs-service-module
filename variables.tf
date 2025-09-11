variable "region" {}

variable "service_name" {}

variable "cluster_name" {}

variable "vpc_id" {}

variable "private_subnets" {}

variable "service_port" {}

variable "service_cpu" {}

variable "service_memory" {}

variable "service_listener" {}

variable "service_task_execution_role" {}

variable "service_launch_type" {}

variable "service_task_count" {}

variable "service_hosts" {}

variable "service_memory" {
    type = map
}

variable "environment_variables" {
  type = list
}

variable "capabilities" {
  type = list
}

variable "service_healthcheck" {}
