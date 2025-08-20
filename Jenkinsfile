pipeline {
    agent any

    tools {
        maven 'Maven3' // Make sure Maven3 is configured in Jenkins
    }

    environment {
        // This is must match the ID of your SonarQube token stored in Jenkins credentials
        SONAR_TOKEN = credentials('SONAR_TOKEN')
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Kundla-Sandhyarani/Project-10.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('MySonarQubeServer') {
                    sh 'mvn sonar:sonar'
                }
            }
        }
    }

    post {
        success {
            echo '✅ Build and analysis completed successfully!'
        }
        failure {
            echo '❌ Build failed. Please check the logs for details.'
        }
    }
}
