resource "aws_alb_target_group" "main" {
  count = var.use_lb ? 1 : 0
  
  name     = substr(format("%s-%s-tg", var.cluster_name, var.service_name), 0, 32)
  port     = var.service_port
  vpc_id   = var.vpc_id
  protocol = "HTTP"
  target_type = "ip"

  health_check {
    healthy_threshold = lookup(var.service_healthcheck, "healthy_threshold", "3") # tentar bater na app 3 vezes antes de considerar saudável
    unhealthy_threshold = lookup(var.service_healthcheck, "unhealthy_threshold", "10") # tentar bater na app 10 vezes antes de considerar não saudável
    timeout = lookup(var.service_healthcheck, "timeout", "5") # tempo limite para cada solicitação de verificação de integridade
    interval = lookup(var.service_healthcheck, "interval", "30") # intervalo entre as verificações de integridade
    matcher = lookup(var.service_healthcheck, "matcher", "200") # código de status HTTP que indica que a verificação de integridade foi bem-sucedida
    path = lookup(var.service_healthcheck, "path", "/") # caminho para a rota de verificação de integridade
    port = lookup(var.service_healthcheck, "port", var.service_port) # porta para a rota de verificação de integridade
  }
  
  lifecycle {
    create_before_destroy = false
  }
}