pipeline {
    agent {
        docker {
            dockerfile true
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
