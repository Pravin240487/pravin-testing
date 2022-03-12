pipeline {
   environment {
     TERRAFORM_VERSION = "0.14.10"
     PYTHON_VERSION = "3.7"
     AWS_DEFAULT_REGION="us-east-1" 
   }
   agent {
    label "linux"
   }
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
    // some block
               sh """
               aws configure set aws_access_key_id "AKIAUZDCYUJI4TERXMX3"
               aws configure set aws_secret_access_key "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"
               aws sts get-caller-identity
               aws s3 ls
               lsb_release -a
               echo "Deploying Code"
               curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
               unzip -o awscliv2.zip
               aws --version
               """
                
               
          }
      }
   }
}
