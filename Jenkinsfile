pipeline {

    agent any

    parameters {

        string(
            name: 'QUEUE_NAME',
            defaultValue: 'ORDER_QUEUE',
            description: 'Queue Name'
        )

        string(
            name: 'MSG_VPN_NAME',
            defaultValue: 'service01',
            description: 'Message VPN'
        )

        booleanParam(
            name: 'INGRESS_ENABLED',
            defaultValue: true,
            description: 'Enable Ingress'
        )

        booleanParam(
            name: 'EGRESS_ENABLED',
            defaultValue: true,
            description: 'Enable Egress'
        )
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

                withCredentials([
                    string(credentialsId: 'SOLACE_SEMP_URL', variable: 'SEMP_URL'),
                    string(credentialsId: 'SOLACE_USERNAME', variable: 'USERNAME'),
                    string(credentialsId: 'SOLACE_PASSWORD', variable: 'PASSWORD'),
                    string(credentialsId: 'SOLACE_MSG_VPN', variable: 'VPN')
                ]) {

                    bat """
                    terraform plan ^
                    -out=tfplan ^
                    -var="semp_url=%SEMP_URL%" ^
                    -var="username=%USERNAME%" ^
                    -var="password=%PASSWORD%" ^
                    -var="msg_vpn_name=%MSG_VPN_NAME%" ^
                    -var="queue_name=%QUEUE_NAME%" ^
                    -var="ingress_enabled=%INGRESS_ENABLED%" ^
                    -var="egress_enabled=%EGRESS_ENABLED%" ^
                    """
                }
            }
        }

        // stage('Approval') {
        //     steps {
        //         input message: "Approve Terraform Apply?"
        //     }
        // }

        stage('Terraform Apply') {
            steps {

                withCredentials([
                    string(credentialsId: 'SOLACE_SEMP_URL', variable: 'SEMP_URL'),
                    string(credentialsId: 'SOLACE_USERNAME', variable: 'USERNAME'),
                    string(credentialsId: 'SOLACE_PASSWORD', variable: 'PASSWORD'),
                    string(credentialsId: 'SOLACE_MSG_VPN', variable: 'VPN')
                ]) {

                    bat """
                    terraform apply -auto-approve tfplan
                    """
                }
            }
        }

    }

    post {

        success {
            echo 'Queue created successfully.'
        }

        failure {
            echo 'Pipeline failed.'
        }

    }
}