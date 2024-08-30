pipeline {
    agent any

    environment {
        SONARQUBE_SERVER = 'MySonarQubeServer' // Name as configured in Jenkins
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building the code...'
                bat 'mvn clean install' // Use bat for Windows
            }
        }

        stage('Unit and Integration Tests') {
            steps {
                echo 'Running unit and integration tests...'
                bat 'mvn test' // Use bat for Windows
            }
        }

        stage('Code Analysis') {
            steps {
                echo 'Analyzing code...'
                withSonarQubeEnv(SONARQUBE_SERVER) {
                    bat '"C:\\Users\\milan\\Downloads\\sonarqube-10.6.0.92116\\sonarqube-10.6.0.92116\\bin\\sonar-scanner.bat" -Dsonar.projectKey=my-project-key -Dsonar.sources=.' // Use bat for Windows and ensure full path
                }
            }
        }

        stage('Security Scan') {
            steps {
                echo 'Performing security scan...'
                bat './dependency-check.bat' // Use bat for Windows
            }
        }

        stage('Deploy to Staging') {
            steps {
                echo 'Deploying to staging...'
                bat './deploy-to-staging.bat' // Use bat for Windows
            }
        }

        stage('Integration Tests on Staging') {
            steps {
                echo 'Running integration tests on staging...'
                bat './run-integration-tests.bat' // Use bat for Windows
            }
        }

        stage('Deploy to Production') {
            steps {
                echo 'Deploying to production...'
                bat './deploy-to-production.bat' // Use bat for Windows
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
