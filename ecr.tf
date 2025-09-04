resource "aws_ecr_repository" "mateus-ci-api" {
  name                 = "mateus-ci"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Iac = "True"
  }
}