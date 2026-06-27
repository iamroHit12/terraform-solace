pipeline {

    agent any

    stages {

        stage('Terraform Version') {
            steps {
                bat 'terraform version'
            }
        }

        stage('Terraform Init') {
            steps {
                bat 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                bat 'terraform validate'
            }
        }

    }
}