pipeline {
  agent { dockerfile true }
  stages {
  stage("terraform-fmt"){
    steps {
           sleep 10
           sh 'terraform fmt'
  }
  }
  }
}
