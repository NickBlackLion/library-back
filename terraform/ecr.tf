resource "aws_ecr_repository" "library_app" {
  name = "library_app"
}

resource "aws_ecr_repository" "library_nginx" {
  name = "library_nginx"
}

resource "null_resource" "docker_login" {
  provisioner "local-exec" {
    command = "docker run --rm -v ~/.aws:/root/.aws amazon/aws-cli ecr get-login-password | docker login --username AWS --password-stdin 276444395597.dkr.ecr.eu-central-1.amazonaws.com"
  }
}

resource "null_resource" "docker_push" {
  provisioner "local-exec" {
    command = "docker-compose push"
  }

  depends_on = [aws_ecr_repository.library_app, aws_ecr_repository.library_nginx]
}
