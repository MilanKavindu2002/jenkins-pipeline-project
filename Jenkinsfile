pipeline {
    agent any

    environment {
        // Define any environment variables you need here
        // For example: JAVA_HOME, MAVEN_HOME, etc.
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building the code...'
                // Build the code using Maven
                sh 'mvn clean install'
            }
        }

        stage('Unit and Integration Tests') {
            steps {
                echo 'Running unit and integration tests...'
                // Run unit tests using Maven
                sh 'mvn test'
            }
        }

        stage('Code Analysis') {
            steps {
                echo 'Analyzing code...'
                // Perform code analysis using SonarQube
                sh 'sonar-scanner'
            }
        }

        stage('Security Scan') {
            steps {
                echo 'Performing security scan...'
                // Perform security scan using OWASP Dependency-Check
                sh 'dependency-check.sh'
            }
        }

        stage('Deploy to Staging') {
            steps {
                echo 'Deploying to staging...'
                // Deploy the application to the staging server
                sh './deploy-to-staging.sh'
            }
        }

        stage('Integration Tests on Staging') {
            steps {
                echo 'Running integration tests on staging...'
                // Run integration tests on the staging environment
                sh './run-integration-tests.sh'
            }
        }

        stage('Deploy to Production') {
            steps {
                echo 'Deploying to production...'
                // Deploy the application to the production server
                sh './deploy-to-production.sh'
            }
        }
    }

    post {
        success {
            echo 'Build and deployment were successful!'
            // Send notification emails on success
            mail to: 'developer@example.com',
                 subject: "Pipeline Success",
                 body: "The pipeline has completed successfully.",
                 attachLog: true
        }
        failure {
            echo 'Build or deployment failed!'
            // Send notification emails on failure
            mail to: 'developer@example.com',
                 subject: "Pipeline Failure",
                 body: "The pipeline has failed. Check the logs for details.",
                 attachLog: true
        }
    }
}
