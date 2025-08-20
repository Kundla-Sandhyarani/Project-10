pipeline {
    agent any

    tools {
        maven 'Maven3' // Make sure Maven3 is configured in Jenkins
    }

    environment {
        // Optional: If you're using SonarQube, set the token securely in Jenkins credentials
        SONAR_TOKEN = credentials('sonar-token-id')
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
            when {
                expression { return env.SONAR_TOKEN != null }
            }
            steps {
                withSonarQubeEnv('MySonarQubeServer') {
                    sh 'mvn sonar:sonar'
                }
            }
        }
    }

    post {
        success {
            echo 'Build completed successfully!'
        }
        failure {
            echo 'Build failed. Please check the logs.'
        }
    }
}
