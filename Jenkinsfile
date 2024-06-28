pipeline {
    agent {
        docker {
            image 'datdo27122003/custom-jenkins:latest'
            args '-u root:root'  // Use root user to avoid permission issues
        }
    }
    stages {
        stage('Build') {
            steps {
                script {
                    // Building your application code
                    sh 'echo "Building application..."'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    // Running tests
                    sh 'echo "Running tests..."'
                }
            }
        }
    }
}
