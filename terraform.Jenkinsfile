pipeline {
    agent any

    parameters {
        choice(name: 'TF_ACTION', choices: ['plan', 'apply', 'destroy'], description: 'Select Terraform action')
        string(name: 'AWS_REGION', defaultValue: 'us-west-2', description: 'AWS Region')
        string(name: 'AWS_ACCESS_KEY_ID', defaultValue: 'YOUR_DEFAULT_ACCESS_KEY', description: 'AWS Access Key')
        string(name: 'AWS_SECRET_ACCESS_KEY', defaultValue: 'YOUR_DEFAULT_SECRET_KEY', description: 'AWS Secret Key')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Set Environment Variables') {
            steps {
                script {
                    withCredentials([
                        string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),
                        string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')
                    ]) {
                        env.AWS_REGION             = params.AWS_REGION
                        env.AWS_ACCESS_KEY_ID     = AWS_ACCESS_KEY_ID
                        env.AWS_SECRET_ACCESS_KEY = AWS_SECRET_ACCESS_KEY
                    }
                }
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Action') {
            steps {
                script {
                    sh "terraform var -var='aws_region=${env.AWS_REGION}' -var='aws_access_key=${env.AWS_ACCESS_KEY_ID}' -var='aws_secret_key=${env.AWS_SECRET_ACCESS_KEY}'"
                    
                    if (params.TF_ACTION == 'plan') {
                        sh 'terraform plan'
                    } else if (params.TF_ACTION == 'apply') {
                        sh 'terraform apply -auto-approve'
                    } else if (params.TF_ACTION == 'destroy') {
                        sh 'terraform destroy -auto-approve'
                    } else {
                        error 'Invalid Terraform action selected'
                    }
                }
            }
        }
    }
}
