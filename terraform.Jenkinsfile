pipeline {
    agent any
    
    stages {
        stage('Choose Terraform Action') {
            steps {
                script {
                    def action = input(
                        id: 'terraformAction',
                        message: 'Choose Terraform Action to Perform:',
                        parameters: [
                            choice(choices: ['plan', 'apply', 'destroy'], description: 'Select Action', name: 'TF_ACTION')
                        ]
                    )
                }
            }
        }
        
        stage('Input Credentials') {
            when {
                expression { return env.TF_ACTION in ['apply', 'destroy'] }
            }
            steps {
                script {
                    def awsAccessKeyId = input(
                        id: 'awsAccessKeyId',
                        message: 'Enter AWS Access Key ID:',
                        parameters: [
                            string(defaultValue: '', description: 'AWS Access Key ID', name: 'AWS_ACCESS_KEY_ID')
                        ]
                    )
                    
                    def awsSecretAccessKey = input(
                        id: 'awsSecretAccessKey',
                        message: 'Enter AWS Secret Access Key:',
                        parameters: [
                            string(defaultValue: '', description: 'AWS Secret Access Key', name: 'AWS_SECRET_ACCESS_KEY')
                        ]
                    )
                }
            }
        }
        
        stage('Terraform Action') {
            steps {
                script {
                    def terraformAction = env.TF_ACTION ?: 'plan'
                    
                    if (terraformAction == 'apply' || terraformAction == 'destroy') {
                        sh "echo 'Running Terraform ${terraformAction} with AWS Access Key: ${env.AWS_ACCESS_KEY_ID} and Secret Key: ${env.AWS_SECRET_ACCESS_KEY}'"
                        // Run Terraform apply or destroy commands using the provided credentials
                    } else {
                        sh "echo 'Running Terraform ${terraformAction}'"
                        // Run Terraform plan command
                    }
                }
            }
        }
        // Other stages of your pipeline
    }
    // Post-build actions, notifications, etc.
}
