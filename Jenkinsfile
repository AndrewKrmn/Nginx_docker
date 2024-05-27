pipeline {
    agent any
    
    triggers {
        pollSCM('H/5 * * * *') 
    }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('token') // Заміна на ваш ID
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
                sh 'docker login -u chikibevchik -p ${DOCKERHUB_CREDENTIALS}'
                sh ‘docker push chikibevchik/nginx-site’
                }
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline finished'
        }
    }

