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
                sh 'mvn test'
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