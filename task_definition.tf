resource "aws_ecs_task_definition" "task_definition" {
  family                = "worker"
  container_definitions = jsonencode(
    [{
      "essential": true,
      "memory": 512,
      "name": "worker",
      "cpu": 2,
      "image": "service",
      "environment": []
  }]
  )
}