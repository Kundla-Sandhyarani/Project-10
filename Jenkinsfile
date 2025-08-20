pipeline {
    agent any

    tools {
        maven 'Maven 3.8.1' // Match your Jenkins tool config
    }

    environment {
        SONAR_TOKEN = credentials('sonar-token') // Add this in Jenkins credentials
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-username/demo-java-sonar.git'
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
                    sh 'mvn sonar:sonar -Dsonar.login=$SONAR_TOKEN'
                }
            }
        }
    }
}
