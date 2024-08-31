pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                // Example command: sh 'mvn clean install'
            }
        }
        stage('Unit and Integration Tests') {
            steps {
                echo 'Running Unit and Integration Tests...'
                // Example command: sh 'mvn test'
            }
        }
        stage('Code Analysis') {
            steps {
                echo 'Running Code Analysis...'
                // Use a tool like SonarQube
            }
        }
        stage('Security Scan') {
            steps {
                echo 'Running Security Scan...'
                // Use a tool like OWASP Dependency-Check
            }
        }
        stage('Deploy to Staging') {
            steps {
                echo 'Deploying to Staging...'
                // Example command: sh 'deploy-to-staging.sh'
            }
        }
        stage('Integration Tests on Staging') {
            steps {
                echo 'Running Integration Tests on Staging...'
                // Run integration tests in the staging environment
            }
        }
        stage('Deploy to Production') {
            steps {
                echo 'Deploying to Production...'
                // Example command: sh 'deploy-to-prod.sh'
            }
        }
    }

    post {
        success {
            emailext(
                subject: "Jenkins Pipeline Success: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: """
                    The Jenkins pipeline ${env.JOB_NAME} build #${env.BUILD_NUMBER} completed successfully.
                    
                    Check the build details at: ${env.BUILD_URL}

                    - Build Status: SUCCESS
                """,
                to: 'milankavindu174@gmail.com',
                attachLog: true
            )
        }
        failure {
            emailext(
                subject: "Jenkins Pipeline Failure: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: """
                    The Jenkins pipeline ${env.JOB_NAME} build #${env.BUILD_NUMBER} has failed.
                    
                    Check the build details at: ${env.BUILD_URL}

                    - Build Status: FAILURE
                """,
                to: 'milankavindu174@gmail.com',
                attachLog: true
            )
        }
    }
}
