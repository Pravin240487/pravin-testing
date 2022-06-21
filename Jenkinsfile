pipeline {
   agent none
   stages {
     stage('input') {
       agent any
       input {
         message "What is your first name?"
         ok "Submit"
         parameters {
           string(defaultValue: 'Dave', name: 'FIRST_NAME', trim: true) 
         }
       }
       steps {
         echo "Good Morning, $FIRST_NAME"
         sh '''
           hostname
           cat /etc/redhat-release
         '''
       }
     }
   }
    agent
    {
        label 'linux'
    }
    stages
    {
        stage("ConfigAWS") {
            steps {
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-key-pravin', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) 
                    {
                        sh """
                        aws --version
                        aws s3 $ls
                        apt-get update
                        apt-get install wget
                        apt install unzip -y
                        wget https://releases.hashicorp.com/terraform/1.0.5/terraform_1.0.5_linux_amd64.zip
                        unzip terraform_1.0.5_linux_amd64.zip
                        mv terraform /usr/local/bin/
                        """
                    }  
                    
                }
            }
        stage("TerraformInit") {
            steps {

                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-key-pravin', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) 
                    {                
                        sh """
                        terraform init -input=false
                        terraform plan -out=tfplan -input=false
                        terraform apply -auto-approve
                        """
                    }   
                }
            }         
        stage("TerraformValidate") {
            steps {

                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-key-pravin', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) 
                    {                
                        sh """
                        terraform plan -out=tfplan -input=false
                        """
                    }   
                }
            }         
        stage("TerraformApply") {
            steps {

                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-key-pravin', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) 
                    {                
                        sh """
                        terraform destroy -auto-approve
                        """
                    }   
                }
            }         
        
    }
    post
    {
        success
        {
            emailext (
                to: "sendtopravin@gmail.com",
                subject: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                body: """<p>SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
        <p>Check console output at "<a href="${env.BUILD_URL}">${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>"</p>"""
            )
        }
        failure
        {
            emailext (
                to: "psoundararajan@tonikbank.com",
                subject: "FAILURE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                body: """<p>FAILURE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
        <p>Check console output at "<a href="${env.BUILD_URL}">${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>"</p>"""
            )
        }
    }
    }
