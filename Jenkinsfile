pipeline {
    agent any

    tools {
        maven 'Default Maven' // Asegúrate de que 'Default Maven' está configurado en Jenkins
    }

    stages {
        stage('SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building...'
                sh 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing...'
                sh 'mvn test'
            }
        }

        stage('Publish Test Results') {
            steps {
                echo 'Publishing JUnit test results...'
                junit '**/target/surefire-reports/*.xml'
            }
        }

        stage('Archive JaCoCo Report') {
            steps {
                echo 'Archiving JaCoCo coverage report...'
                archiveArtifacts artifacts: '**/target/site/jacoco/*', allowEmptyArchive: true
            }
        }

        stage('Deploy Docker Container') {
            steps {
                echo 'Deploying Docker Container...'
                sh '''
                docker build -t test1_app:latest .
                docker stop test1_app_container || true
                docker rm test1_app_container || true
                docker run -d -p 8080:8080 --name test1_app_container test1_app:latest
                '''
            }
        }

        stage('Provision Infrastructure with Terraform') {
            steps {
                echo 'Running Terraform to provision infrastructure...'
                dir('terraform') {
                    sh '''
                    terraform init
                    terraform apply -auto-approve
                    '''
                }
            }
        }
    }

    post {
        success {
            slackSend(channel: '#integracion-slack-con-jenkins', tokenCredentialId: 'slack-token', message: "Pipeline '${env.JOB_NAME} [${env.BUILD_NUMBER}]' completed successfully")
        }
        failure {
            slackSend(channel: '#integracion-slack-con-jenkins', tokenCredentialId: 'slack-token', message: "Pipeline '${env.JOB_NAME} [${env.BUILD_NUMBER}]' failed")
        }
        always {
            slackSend(channel: '#integracion-slack-con-jenkins', tokenCredentialId: 'slack-token', message: "Pipeline '${env.JOB_NAME} [${env.BUILD_NUMBER}]' finished with status: ${currentBuild.currentResult}")
        }
    }
}
