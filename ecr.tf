# Elastic Container Repository
resource "aws_ecr_repository" "aws-ecr" {
  name = "docker-ecr"
  tags = {
    Name        = "container-repo"
    Environment = "production"
  }
}

