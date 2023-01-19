resource "aws_sagemaker_code_repository" "main" {
  code_repository_name = var.project_name

  git_config {
    repository_url = var.git_code_repo_url
    //secret_arn     = aws_secretsmanager_secret.example.arn
  }
}