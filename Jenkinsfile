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
               sh """
               lsb_release -a
               echo "Deploying Code"
               curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
               unzip -o awscliv2.zip
               apt install wget
               wget https://s3.amazonaws.com/aws-cli/awscli-bundle.zip
               unzip -o awscli-bundle.zip
               ./awscli-bundle/install -b ~/bin/aws
               pwd
               ls -la
               cd aws
               ls -la
               cd ..
               
               cd /usr/local/bin/
               ls -la
               pwd
               """
          }
      }
   }
}
