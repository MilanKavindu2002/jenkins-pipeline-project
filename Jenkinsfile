pipeline {
    agent any

    environment {
        SONARQUBE_SERVER = 'MySonarQubeServer' // Name as configured in Jenkins
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building the code...'
                sh 'mvn clean install' // Ensure Maven is installed and in PATH
            }
        }

        stage('Unit and Integration Tests') {
            steps {
                echo 'Running unit and integration tests...'
                sh 'mvn test'
            }
        }

        stage('Code Analysis') {
            steps {
                echo 'Analyzing code...'
                withSonarQubeEnv(SONARQUBE_SERVER) {
                    sh 'sonar-scanner' // Ensure SonarQube Scanner is installed and in PATH
                }
            }
        }

        stage('Security Scan') {
            steps {
                echo 'Performing security scan...'
                sh './dependency-check.sh' // Ensure script is executable and in PATH
            }
        }

        stage('Deploy to Staging') {
            steps {
                echo 'Deploying to staging...'
                sh './deploy-to-staging.sh' // Ensure script is executable and in PATH
            }
        }

        stage('Integration Tests on Staging') {
            steps {
                echo 'Running integration tests on staging...'
                sh './run-integration-tests.sh' // Ensure script is executable and in PATH
            }
        }

        stage('Deploy to Production') {
            steps {
                echo 'Deploying to production...'
                sh './deploy-to-production.sh' // Ensure script is executable and in PATH
            }
        }
    }

    post {
        success {
            echo 'Build and deployment were successful!'
            emailext(
                to: 'milankavindu174@gmail.com',
                subject: "Pipeline Success",
                body: "The pipeline has completed successfully.",
                attachLog: true
            )
        }
        failure {
            echo 'Build or deployment failed!'
            emailext(
                to: 'milankavindu174@gmail.com',
                subject: "Pipeline Failure",
                body: "The pipeline has failed. Check the logs for details.",
                attachLog: true
            )
        }
    }
}
