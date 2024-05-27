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
                sh 'docker run -d -p 80:80 chikibevchik/nginx-site'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry("https://index.docker.io/v1/", "chort") {
                        sh "docker push chikibevchik/nginx-site"
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
