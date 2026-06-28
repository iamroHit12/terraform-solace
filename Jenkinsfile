def withTerraform(Closure body) {
    dir('terraform') {
        withCredentials([
            string(credentialsId: 'TERRAFORM_CLOUD_TOKEN', variable: 'TF_TOKEN')
        ]) {
            withEnv(["TF_TOKEN_app_terraform_io=${TF_TOKEN}"]) {
                body()
            }
        }
    }
}

pipeline {

    agent any

    options {
        timestamps()
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '20'))
    }

    parameters {

        string(
            name: 'QUEUE_NAMES',
            defaultValue: 'ORDER_QUEUE',
            description: 'Comma separated queue names'
        )
    }

    stages {

        stage('Terraform Init') {
            steps {
                script {
                    withTerraform {
                        bat 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Format Check') {
            steps {
                dir('terraform') {
                    bat 'terraform fmt -check -recursive'
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
                        string(credentialsId: 'SOLACE_DEV_SEMP_URL', variable: 'SEMP_URL'),
                        string(credentialsId: 'SOLACE_DEV_USERNAME', variable: 'USERNAME'),
                        string(credentialsId: 'SOLACE_DEV_PASSWORD', variable: 'PASSWORD'),
                        string(credentialsId: 'TERRAFORM_CLOUD_TOKEN', variable: 'TF_TOKEN')
                    ]) {

                        withEnv(["TF_TOKEN_app_terraform_io=${TF_TOKEN}"]) {

                            bat """
                            terraform plan ^
                            -out=tfplan ^
                            -var-file="environments/dev.tfvars" ^
                            -var="semp_url=%SEMP_URL%" ^
                            -var="username=%USERNAME%" ^
                            -var="password=%PASSWORD%" ^
                            -var="queue_names=%QUEUE_NAMES%"
                            """

                        }
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
                        string(credentialsId: 'SOLACE_DEV_SEMP_URL', variable: 'SEMP_URL'),
                        string(credentialsId: 'SOLACE_DEV_USERNAME', variable: 'USERNAME'),
                        string(credentialsId: 'SOLACE_DEV_PASSWORD', variable: 'PASSWORD'),
                        string(credentialsId: 'TERRAFORM_CLOUD_TOKEN', variable: 'TF_TOKEN')
                    ]) {
                        
                        withEnv(["TF_TOKEN_app_terraform_io=${TF_TOKEN}"]){
                            bat """
                            terraform apply -auto-approve tfplan
                            """
                        }
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