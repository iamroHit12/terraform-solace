pipeline {

    agent any

    environment {
        SEMP_URL = credentials('SOLACE_SEMP_URL')
        USERNAME = credentials('SOLACE_USERNAME')
        PASSWORD = credentials('SOLACE_PASSWORD')
        VPN      = credentials('SOLACE_MSG_VPN')
    }

    stages {

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

        stage('Terraform Plan') {
            steps {
                bat """
                terraform plan ^
                -out=tfplan ^
                -var="semp_url=%SEMP_URL%" ^
                -var="username=%USERNAME%" ^
                -var="password=%PASSWORD%" ^
                -var="msg_vpn_name=%VPN%" ^
                -var="queue_name=ORDER_QUEUE"
                """
            }
        }

    }
}