pipeline {
    agent any
    stages {
   
        stage('Build/Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'Dockerhub') {
                        sh 'ls -l'
                        sh 'docker build -t datdo27122003/nodejs-env .'
                        sh 'docker push datdo27122003/nodejs-env'
                    }
                }
            }
        }
          stage('Deploy container') {
           
            steps {
                withCredentials([file(credentialsId: 'main_key_pair', variable: 'main_key_pair')]) {
                    sh 'ls -la'
                    sh """
                    if [ -f "main_key_pair" ]; then
                        echo "File exists: main_key_pair"
                    else
                        echo "File does not exist: main_key_pair"
                    fi
                    """
                    sh 'ansible --version'
                    sh 'ls -la'
                    sh 'chmod 400 main_key_pair 'y
                    sh 'ansible-playbook -i inventory.ini --private-ke main_key_pair playbook.yml'
                }
            }
          }
    }
}

