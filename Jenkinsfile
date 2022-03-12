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
             withCredentials([aws(accessKey.Variable:’AWS_ACCESS_KEY_ID’,credentialsId:’spravi’,secretKeyVariable:’AWS_SECRET_ACCESS_KEY’)]) 
             {
               sh """
              
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
}
