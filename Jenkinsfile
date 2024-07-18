pipeline {
    agent {
        docker {
            image 'node:20.15.0-alpine3.20'
            args '-u root:root -p 3000:3000'
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
