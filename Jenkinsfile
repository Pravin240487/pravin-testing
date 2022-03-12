pipeline {
   environment {
     TERRAFORM_VERSION = "0.14.10"
     PYTHON_VERSION = "3.7"
     AWS_DEFAULT_REGION="us-east-1" 
     THE_BUTLER_SAYS_SO=credentials('spravi') 
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
    //         withCredentials([aws(accessKeyVariable:'AKIAUZDCYUJI4TERXMX3',credentialsId:’spravi’,secretKeyVariable:'54IZxLmPY89r+XNncC1Dp7QGzHL5+zxkpK68eYT5')]) 
   //          {
               sh """
              
               lsb_release -a
               echo "Deploying Code"
               curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
               unzip -o awscliv2.zip
               aws --version
               aws ec2 describe-instances
               aws s3 ls
               """
  //           }   
               
          }
      }
   }
}
