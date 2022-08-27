pipeline {
  agent { dockerfile true }
  stages {
  stage("terraform-fmt"){
    steps {
           sh 'terraform -version'
           sh 'terraform fmt'
  }
  }
  }
}
