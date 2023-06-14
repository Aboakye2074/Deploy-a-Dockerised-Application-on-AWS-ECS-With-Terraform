
# iam.tf | IAM Role Policies
resource "aws_iam_role" "ecsTaskExecutionRole" {
  name               = ""
  assume_role_policy = file("${path.module}/assume_role_policy.json")
  tags = {
    Name        = "app-iam-role"
    Environment = "production"
  }
}


# attch policy
resource "aws_iam_role_policy_attachment" "ecsTaskExecutionRole_policy" {
  role       = aws_iam_role.ecsTaskExecutionRole.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}