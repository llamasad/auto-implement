pipeline {
    agent {
        docker {
            image 'node:20.15.0-alpine3.20'
            args '-u root:root'
            reuseNode true  // This option keeps the container running after the pipeline finishes
        }
    }
    stages {
        stage('build') {
            steps {
                sh 'node --version'
            }
        }
    }
    options {
        skipDefaultCheckout(true)  // Skip checking out code from source repository
    }
}
