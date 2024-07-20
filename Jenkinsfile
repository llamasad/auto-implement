pipeline {
    agent any
    stages {
   
        stage('Build/Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'Dockerhub') {
                        sh 'ls -l'
                        sh 'docker build -t datdo2712003/nodejs-env .'
                        sh 'docker push datdo2712003/nodejs-env'
                    }
                }
            }
        }
          stage('Deploy Mysql container') {
           
            steps {
                withCredentials([file(credentialsId: 'main_key_pair', variable: 'main_key_pair')]) {
                    sh 'ls -la'
                    sh "cp /$main_key_pair main_key_pair"
                    sh 'cat main_key_pair'
                    sh 'ansible --version'
                    sh 'ls -la'
                    sh 'chmod 400 main_key_pair '
                    sh 'ansible-playbook -i hosts --private-key main_key_pair playbook.yml'
                }
            }
          }
    }
}

