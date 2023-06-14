# create security group
resource "aws_security_group" "ecs_cluster_instance_sg" {
  name        = "ecs-cluster-instance-sg"
  description = "Security group for ECS cluster instances"

  vpc_id = aws_vpc.default.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# create key pair
resource "aws_key_pair" "my_key_pair" {
  key_name   = "my-key-pair"
  public_key = file("~/.ssh/my-key-pair.pub")
}

# launch ec2 instance
resource "aws_instance" "ecs_instance" {
  ami           = var.ami # Replace with the desired EC2 AMI ID
  instance_type = var.instance_type  # Replace with the desired instance type
  key_name      = "your_key_pair"  # Replace with your SSH key pair name
  security_group_ids = [aws_security_group.ecs_cluster_instance_sg.id]  # Replace with the desired security group IDs
  subnet_id     = "subnet-xxxxxxxx"  # Replace with the desired subnet ID

  tags = {
    Name = "ECS Instance"
  }

  # Additional configuration for your EC2 instance can be added here
}



# cloud watch
resource "aws_cloudwatch_log_group" "log-group" {
  name = "cloudwatch-logs"

  tags = {
    Name        = "app-ecs"
    Environment = "production"
  }
}

