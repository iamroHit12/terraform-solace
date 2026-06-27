pipeline {

    agent any

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

                withCredentials([
                    string(credentialsId: 'SOLACE_SEMP_URL', variable: 'SEMP_URL'),
                    string(credentialsId: 'SOLACE_USERNAME', variable: 'USERNAME'),
                    string(credentialsId: 'SOLACE_PASSWORD', variable: 'PASSWORD'),
                    string(credentialsId: 'SOLACE_MSG_VPN', variable: 'VPN')
                ]) {

                    bat '''
                    terraform plan ^
                    -out=tfplan ^
                    -var="semp_url=%SEMP_URL%" ^
                    -var="username=%USERNAME%" ^
                    -var="password=%PASSWORD%" ^
                    -var="msg_vpn_name=%VPN%" ^
                    -var="queue_name=ORDER_QUEUEE"
                    '''

                }
            }
        }

    }

}