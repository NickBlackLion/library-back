resource "aws_ecs_cluster" "library" {
  name = var.cluster_name
}

resource "aws_ecs_task_definition" "app_task" {
  container_definitions = jsonencode([
    {
      name = "library-nginx",
      image = "${aws_ecr_repository.library_nginx.repository_url}:latest",
      cpu = 75,
      memory = 128,
      portMappings = [
        {
          hostPort = 80,
          containerPort = 80,
          protocol = "tcp"
        }
      ],
      essential = true,
      links = ["library-app"]
    },
    {
      name = "library-app",
      image = "${aws_ecr_repository.library_app.repository_url}:latest",
      cpu = 75,
      memory = 256,
      essential = true,
      command = ["./run.sh"]
    }
  ])
  family = "library-task"
  network_mode = "bridge"
  memory = "768"
  cpu = "150"
  requires_compatibilities = ["EC2"]
}

resource "aws_ecs_service" "app_service" {
  name = "app_service"
  task_definition = aws_ecs_task_definition.app_task.arn
  cluster = aws_ecs_cluster.library.id
  desired_count = 1
  launch_type = "EC2"
  scheduling_strategy = "REPLICA"
}
