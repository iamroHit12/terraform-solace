pipeline {

    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Source code downloaded from GitHub'
            }
        }

        stage('Terraform Version') {
            steps {
                bat 'terraform version'
            }
        }

    }
}