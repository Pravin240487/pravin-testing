pipeline {
   environment {
     TERRAFORM_VERSION = "0.14.10"
     PYTHON_VERSION = "3.7"
     AWS_DEFAULT_REGION="us-east-1" 
   }
   agent any
   stages {
       stage('Build Code') {
           steps {
               sh """
               echo "Building Artifact"
               """
           }
       }
      stage('Deploy Code') {
          steps {
               sh """
               echo "Deploying Code"
               curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
               unzip awscliv2.zip -y
               """
          }
      }
   }
}
