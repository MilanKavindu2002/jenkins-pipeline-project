pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
               
            }
        }
        stage('Unit and Integration Tests') {
            steps {
                echo 'Running Unit and Integration Tests...'
               
            }
        }
        stage('Code Analysis') {
            steps {
                echo 'Running Code Analysis...'
               
            }
        }
        stage('Security Scan') {
            steps {
                echo 'Running Security Scan...'
             
            }
        }
        stage('Deploy to Staging') {
            steps {
                echo 'Deploying to Staging...'
               
            }
        }
        stage('Integration Tests on Staging') {
            steps {
                echo 'Running Integration Tests on Staging...'
               
            }
        }
        stage('Deploy to Production') {
            steps {
                echo 'Deploying to Production...'
               
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
