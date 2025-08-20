pipeline {
    agent any

    tools {
        maven 'Maven3'
    }

    environment {
        SONAR_TOKEN = credentials('SONAR_TOKEN')
    }

    stages {
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
                withSonarQubeEnv('Sonarqube') {
                    sh 'mvn sonar:sonar'
                }
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t project-10-image .'
            }
        }
        stage('Docker Run') {
            steps {
                sh 'docker run -d --name project-10-container -p 8080:8080 project-10-image'
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
