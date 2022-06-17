pipeline {
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
    }
