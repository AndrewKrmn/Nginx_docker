pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Клонувати код з репозиторію
                git 'https://github.com/your/repository.git'
            }
        }
        
        stage('Build') {
            steps {
                // Виконати будівництво проекту (наприклад, для мови Java)
                sh 'mvn clean package'
            }
        }
        
        stage('Test') {
            steps {
                // Виконати тести (якщо вони є)
                sh 'mvn test'
            }
        }
        
        stage('Deploy') {
            steps {
                // Розгортання або поширення (залежно від потреб)
                // Наприклад, можна використовувати scp для копіювання файлів на віддалений сервер
                sh 'scp target/*.jar user@example.com:/path/to/destination'
            }
        }
    }
    
    post {
        always {
            // Виконати завжди, навіть якщо є помилка
            // Можна додати дії, такі як відправка повідомлення про статус конвеєра
            echo 'Pipeline finished'
        }
    }
}
