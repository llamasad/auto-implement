

/* Requires the Docker Pipeline plugin */
pipeline {
    agent { docker { image 'node:20.15.0-alpine3.20'
    args '-u root:root' } }
    stages {
        stage('build') {
            steps {
                sh 'node --version'
            }
        }
    }
}

