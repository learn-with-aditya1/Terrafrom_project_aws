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
        
        stage('Terraform Action') {
            steps {
                script {
                    def terraformAction = env.TF_ACTION ?: 'plan'
                    
                    if (terraformAction == 'apply' || terraformAction == 'destroy') {
                        sh "echo 'Running Terraform ${terraformAction}'"
                        // Run Terraform apply or destroy commands using IAM role associated with EC2 instance
                        sh 'terraform init'
                        sh 'terraform ${terraformAction} -auto-approve'
                    } else {
                        echo 'Running Terraform plan'
                        sh 'terraform init'
                        sh 'terraform plan -out=tfplan'
                        
                        echo 'Displaying Terraform plan output'
                        sh 'terraform show -json tfplan'
                    }
                }
            }
        }
        // Other stages of your pipeline
    }
    // Post-build actions, notifications, etc.
}
