pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/AndrewKrmn/Nginx_docker.git'
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
        
        stage('Push') {
            steps {
                sh 'docker push chikibevchik/nginx-site'
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline finished'
        }
    }
}
