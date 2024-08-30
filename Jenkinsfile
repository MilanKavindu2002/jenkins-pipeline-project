pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the code...'
                sh 'mvn clean install' // Ensure Maven is installed and accessible
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
                sh 'sonar-scanner'
            }
        }

        stage('Security Scan') {
            steps {
                echo 'Performing security scan...'
                sh 'dependency-check.sh'
            }
        }

        stage('Deploy to Staging') {
            steps {
                echo 'Deploying to staging...'
                sh './deploy-to-staging.sh'
            }
        }

        stage('Integration Tests on Staging') {
            steps {
                echo 'Running integration tests on staging...'
                sh './run-integration-tests.sh'
            }
        }

        stage('Deploy to Production') {
            steps {
                echo 'Deploying to production...'
                sh './deploy-to-production.sh'
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
