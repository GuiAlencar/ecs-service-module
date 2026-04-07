resource "aws_appautoscaling_target" "main" {
  max_capacity       = var.task_maximum
  min_capacity       = var.task_minimum
  # resource_id é a identificação do recurso que será escalado, seguindo o formato específico para serviços ECS.
  resource_id        = "service/${var.cluster_name}/${aws_ecs_service.main.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}