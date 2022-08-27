pipeline {
  agent {
    docker {
        image 'hashicorp/terraform:light'
        args '-i --entrypoint='
    }
  }
  stages {
  stage("terraform-fmt"){
    steps {
           sh 'terraform -version'
           sh 'terraform fmt'
  }
  }
  }
}
