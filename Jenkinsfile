pipeline {
    agent {
        docker {
            image 'node:20.15.0-alpine3.20'
            args '-u root:root'
        }
    }
    stages {
        stage('build') {
            steps {
                sh 'node --version'
                // keeps the container running for 1 hour
                sh 'npm install'
            }
        }
    }
}
