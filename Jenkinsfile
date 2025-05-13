pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-user/your-repo.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Deploy to Jetty') {
            steps {
                sh 'nohup mvn jetty:run &'
                sh 'sleep 15' // Give Jetty time to start
            }
        }

        stage('Cleanup') {
            steps {
                sh 'pkill -f jetty'
            }
        }
    }
}

