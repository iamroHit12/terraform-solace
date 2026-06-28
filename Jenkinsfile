pipeline {

    agent any

    parameters {

        choice(
            name: 'ENVIRONMENT',
            choices: ['DEV', 'PQA', 'QA', 'PROD'],
            description: 'Select deployment environment'
        )

        string(
            name: 'QUEUE_NAMES',
            defaultValue: 'ORDER_QUEUE',
            description: 'Comma separated queue names'
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

        stage('Print Parameters') {
            steps {
                echo "Environment : ${params.ENVIRONMENT}"
                echo "Queue Names : ${params.QUEUE_NAMES}"
            }
        }

        stage('Prepare Environment') {
            steps {
                script {
                    env.TFVARS_FILE = "environments/${params.ENVIRONMENT.toLowerCase()}.tfvars"
                }

                echo "Terraform Variable File : ${env.TFVARS_FILE}"
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    bat 'terraform init'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir('terraform') {
                    bat 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
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
                        -var="queue_names=%QUEUE_NAMES%"
                        """
                    }
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
                dir('terraform') {
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