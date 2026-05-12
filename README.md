# ecs-service-module
Repositório de modulo para criação de services no ECS

O service execution role (função de execução de tarefa) no Amazon ECS é uma função IAM que concede permissões ao agente do ECS para realizar ações de infraestrutura em seu nome, como puxar imagens do ECR, enviar logs para o CloudWatch e acessar segredos no Secrets Manager. Ele gerencia o ciclo de vida do contêiner, não o código da aplicação

PRIMEIRO PASSO
criar um role para o service do ecs poder assumir, iam.tf

criar o ecr, ecr.tf

criar o recurso do cloudwatch, cloudwatch.tf

criar a task_definition que é a forminha das tasks, task_definitions.tf

criar os target_group para export os services, target_group.tf

criar o security group do service, sg.tf

criar o service que derá vida para nossa aplicação, anexar o load_balancer no service, service.tf

criar uma listener_rule para associar o target_group ao load balancer, listener_rule.tf

criar o autoscaling, autoscaling.tf
criar o autoscaling_cpu criando então uma política de autoscaling cpu_high e cpu_low e depois anexa no alarme do cloudwatch em aws_cloudwatch_metric_alarm.cpu_high e aws_cloudwatch_metric_alarm.cpu_low, autoscaling_cpu.tf

criar autoscaling_tracking_cpu mantem o valor da cpu da minhas tasks, autoscaling_tracking_cpu.tf

criar autoscaling_tracking_requests, autoscaling_tracking_requests.tf

### MUDANDO AS TASKS PARA FARGATE
PRIMEIRO PASSO
 não temos controle em qual região essas tasks irão subir ao usarmos o fargate como capacity provider, então o ordered_placement_strategy que está no arquivo service.tf terá de ser comentado para não dar erro no apply do terraformm, foi criado um dynamic "ordered_placement_strategy" para ele validar se as tasks estão em ec2 ou fargate validando o service_launch_type, service.tf


SEGUNDO PASSO
O launch_type não vai mais funcionar para o uso do fargate, usar então o capacity_provider_strategy, service.tf
