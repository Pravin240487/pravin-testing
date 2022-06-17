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
        stage("TerraformBuild") {
            steps {
                        sh """
                        cd terraform/s3bucket
                        terraform init -input=false
                        terraform plan -out=tfplan -input=false
                        terraform apply -auto-approve
                        """    
                }
            }         
    }
    }
