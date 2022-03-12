pipeline {
   environment {
     TERRAFORM_VERSION = "0.14.10"
     PYTHON_VERSION = "3.7"
     AWS_DEFAULT_REGION="us-east-1" 
   }
   agent {
    node {
   // ...
   withAwsCli( 
         credentialsId: 'spravi', 
         defaultRegion: 'us-east-1']) { 

        sh ''' 
           # COPY CREATED WAR FILE TO AWS S3
           aws s3 ls
        '''
   }
}  
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
               pwd
               ls -la
               chmod -R 755 ./aws/install
               chmod -R 755 /var/jenkins_home/workspace/pravin-testing_main/aws 
               awscli --version
               ls -la
               pwd
               cd /usr/local/bin/
               ls -la 
               """
          }
      }
   }
}
