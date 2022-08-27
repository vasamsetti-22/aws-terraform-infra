pipeline {
  agent { dockerfile true }
  stages {
  stage("terraform-fmt"){
    steps {
           sh 'terraform fmt'
  }
  }
  }
}
