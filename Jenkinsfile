pipeline {
    agent any
    
    triggers {
        pollSCM('H/5 * * * *') 
    }
    
    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout scm
                }
            }
        }
         
        stage('Build') {
            steps {
                sh 'docker build -t chikibevchik/nginx-site .'
            }
        }
        
        stage('Run') {
            steps {
                sh 'docker rm -f chort'
                sh 'docker run --name chort -d -p 80:80 chikibevchik/nginx-site'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                   def dockerImage = docker.build("chikibevchik/nginx-site")
                    docker.withRegistry('https://index.docker.io/v1/', 'chort') {
                        dockerImage.push()
                    }
                }
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline finished'
        }
    }
}
