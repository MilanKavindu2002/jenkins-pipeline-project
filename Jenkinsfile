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
                echo 'Running unit and integration tests...'
               
            }
        }
        stage('Code Analysis') {
            steps {
                echo 'Analyzing code...'
                
            }
        }
        stage('Security Scan') {
            steps {
                echo 'Performing security scan...'
                
            }
        }
        stage('Deploy to Staging') {
            steps {
                echo 'Deploying to staging...'
                
            }
        }
        stage('Integration Tests on Staging') {
            steps {
                echo 'Running integration tests on staging...'
                
            }
        }
        stage('Deploy to Production') {
            steps {
                echo 'Deploying to production...'
               
            }
        }
    }
    post {
        always {
           
            mail to: 'developer@example.com',
                 subject: "Pipeline ${currentBuild.fullDisplayName}",
                 body: "Build finished with status: ${currentBuild.currentResult}"
        }
    }
}
