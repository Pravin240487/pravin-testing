pipeline {
    agent
    {
        label 'linux'
    }
    stages
    {
        stage("Hello") {
            steps {
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-key-pravin', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) 
                    {
                        sh """
                        aws --version
                        aws s3 $ls
                        """
                    }  
                    
                }
            }
    }
    }
