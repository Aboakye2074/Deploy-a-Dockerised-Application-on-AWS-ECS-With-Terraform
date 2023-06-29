resource "aws_ecs_service" "flask_app_demo" {
  name            = "flask-app-demo"
  cluster         = aws_ecs_cluster.aws-ecs-cluster.id
  task_definition = aws_ecs_task_definition.flask_app_demo.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  network_configuration {
    subnets         = []
    security_groups = [aws_security_group.flask_app_demo.id]
    assign_public_ip = true
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.flask_app_demo.arn
    container_name   = "flask-app-demo"
    container_port   = 80
  }
}
