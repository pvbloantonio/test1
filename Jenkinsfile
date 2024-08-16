pipeline {
    agent any

    tools {
        maven 'Default Maven' // Asegúrate de que 'Default Maven' está configurado en Jenkins
    }

    stages {
        stage('SCM') {
            steps {
                // El checkout debe estar dentro de un bloque steps
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building...'
                // Aquí puedes agregar tus comandos de compilación
                sh 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing...'
                // Ejecuta los tests
                sh 'mvn test'
            }
        }

        stage('Publish Test Results') {
            steps {
                echo 'Publishing JUnit test results...'
                // Publica los resultados de las pruebas
                junit '**/target/surefire-reports/*.xml'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying...'
                // Aquí puedes agregar tus comandos de despliegue, por ejemplo:
                //sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
}