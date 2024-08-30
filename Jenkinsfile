pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    echo 'Building the code...'
                    
                }
            }
        }
        stage('Unit and Integration Tests') {
            steps {
                script {
                    echo 'Running unit and integration tests...'
                   
                }
            }
        }
        stage('Code Analysis') {
            steps {
                script {
                    echo 'Performing code analysis...'
                   
                }
            }
        }
        stage('Security Scan') {
            steps {
                script {
                    echo 'Performing security scan...'
                   
                }
            }
        }
        stage('Deploy to Staging') {
            steps {
                script {
                    echo 'Deploying to staging environment...'
                   
                }
            }
        }
        stage('Integration Tests on Staging') {
            steps {
                script {
                    echo 'Running integration tests on staging...'
                  
                }
            }
        }
        stage('Deploy to Production') {
            steps {
                script {
                    echo 'Deploying to production...'
                   
                }
            }
        }
    }

    post {
        success {
            emailext(
                subject: 'Build Successful',
                body: 'The build was successful.',
                to: 'milankavindu174@gmail.com'
            )
        }
        failure {
            emailext(
                subject: 'Build Failed',
                body: 'The build failed. Check the logs for details.',
                to: 'milankavindu174@gmail.com'
            )
        }
    }
}
