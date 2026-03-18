# ecs-service-module
Repositório de modulo para criação de services no ECS

O service execution role (função de execução de tarefa) no Amazon ECS é uma função IAM que concede permissões ao agente do ECS para realizar ações de infraestrutura em seu nome, como puxar imagens do ECR, enviar logs para o CloudWatch e acessar segredos no Secrets Manager. Ele gerencia o ciclo de vida do contêiner, não o código da aplicação

PRIMEIRO PASSO
criar um role para o service do ecs poder assumir, iam.tf

criar o ecr, ecr.tf

criar o recurso do cloudwatch, cloudwatch.tf
