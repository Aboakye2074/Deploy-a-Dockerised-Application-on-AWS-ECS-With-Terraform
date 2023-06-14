# create ecs cluster
resource "aws_ecs_cluster" "aws-ecs-cluster" {
  name = ""
  tags = {
    Name        = "app-ecs"
    Environment = "production"
  }
}

resource "aws_ecs_container_instance" "ecs_container_instance" {
  cluster = aws_ecs_cluster.aws-ecs-cluster.id
  instance_type = var.instance_type
  key_pair = "your_key_pair"  
  security_group_ids = ["sg-xxxxxxxxxxxx"]  
  subnet_id = "subnet-xxxxxxxx"  
  ec2_instance = aws_instance.ecs_instance.id
}