pipeline {
  agent any
  environment {
    AWS_ID = credentials("aws_creds")
    TF_VAR_region = "${env.AWS_DEFAULT_REGION}"
  }
  stages {
    stage ('validate') {
      steps {
        dir ('terraform') {
          sh 'terraform init'
          sh 'terraform validate'
          sh 'terraform plan'
        }
      }
    }
    stage ('build') {
      steps {
        sh 'docker-compose build app'
        sh 'docker run --rm -v $PWD/nginx/static:/library/static 276444395597.dkr.ecr.eu-central-1.amazonaws.com/library-app python3 manage.py collectstatic --noinput'
        sh 'docker-compose build nginx'
      }
    }
    stage ('terraform-apply') {
      steps {
        dir ('terraform') {
          sh 'terraform apply -auto-approve'
        }
      }}
    stage ('destroy') {
      input {
        message "Should it be destroyed?"
        ok "Destroy"
      }
      steps {
        dir ('terraform') {
          sh 'terraform destroy -auto-approve'
        }
      }
    }
  }
}
