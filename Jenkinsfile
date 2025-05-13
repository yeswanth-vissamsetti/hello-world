pipeline {
    agent any

    environment {
        IMAGE_NAME = 'regapp'
        CONTAINER_NAME = 'regapp-container'
        HOST_PORT = '9090'
        CONTAINER_PORT = '8080' // Tomcat default inside
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'github-creds', url: 'https://github.com/yeswanth-vissamsetti/hello-world.git'
            }
        }

        stage('Build WAR with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Run Docker Container') {
            steps {
                sh """
                docker rm -f ${CONTAINER_NAME} || true
                docker run -d -p ${HOST_PORT}:${CONTAINER_PORT} --name ${CONTAINER_NAME} ${IMAGE_NAME}
                """
            }
        }
    }

    post {
        success {
            echo "App is available at: http://<your-server-ip>:${HOST_PORT}"
        }
    }
}

