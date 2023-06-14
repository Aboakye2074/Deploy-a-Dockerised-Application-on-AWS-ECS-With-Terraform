resource "aws_ecs_task_definition" "flask_app_demo" {
  family                   = "flask-app-demo"
  network_mode             = "awsvpc"
  requires_compatibilities = ["EC2"]
  cpu                      = "1"
  memory                   = "128"
  execution_role_arn = aws_iam_role.ecsTaskExecutionRole.id

  container_definitions = <<DEFINITION
  [
    {
        "name": "flask-app-demo",
        "image": "${var.image_repo_url}:${var.image_tag}",
        "essential": true,
        "portMappings": [
            {
                "containerPort": 5000,
                "hostPort": 5000
            }
        ],
        "logConfiguration": {
            "logDriver": "awslogs",
            "options": {
                "awslogs-group": "${aws_cloudwatch_log_group.flask_app_demo.name}",
                "awslogs-region": "${var.aws_region}",
                "awslogs-stream-prefix": "flask-app-demo"
                }
            }
        }
    ]
    DEFINITION
  
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }
}
