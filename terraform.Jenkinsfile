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
                    def awsAccessKeyId = credentials('aws-access-key')
                    def awsSecretAccessKey = credentials('aws-secret-access-key')
                    
                    // Set environment variables for AWS credentials
                    env.AWS_ACCESS_KEY_ID = awsAccessKeyId
                    env.AWS_SECRET_ACCESS_KEY = awsSecretAccessKey
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
