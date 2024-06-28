pipeline {
    agent {
        docker {
            dockerfile true
            image 'node:20.15.0-alpine3.20'
            args '-u 1000:1000'
        }
    }
    stages {
        stage('build') {
            steps {
                sh 'node --version'
            }
        }
    }
}
