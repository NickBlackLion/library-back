pipeline {
  agent any
  environment {
    AWS_ID = credentials("aws_creds")
  }
  stages {
    stage ('Build') {
      steps {
        dir ('terraform') {
          sh 'export TF_VAR_region=$AWS_DEFAULT_REGION'
          sh 'terraform init'
          sh 'terraform validate'
          sh 'terraform plan'
        }
      }
    }
  }
}
