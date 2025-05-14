pipeline {
    agent any

    environment {
        IMAGE_NAME = 'webapp-image'
        CONTAINER_NAME = 'webapp-container'
        PORT = '9090'
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'your-git-credentials-id', url: 'https://github.com/yeswanth-vissamsetti/hello-world'
            }
        }

        stage('Build WAR') {
            steps {
                dir('webapp') {
                    sh 'mvn clean package -DskipTests'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop & Remove Old Container') {
            steps {
                script {
                    sh """
                        if [ \$(docker ps -q -f name=$CONTAINER_NAME) ]; then
                            docker stop $CONTAINER_NAME
                        fi

                        if [ \$(docker ps -aq -f name=$CONTAINER_NAME) ]; then
                            docker rm $CONTAINER_NAME
                        fi
                    """
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p $PORT:8080 --name $CONTAINER_NAME $IMAGE_NAME'
            }
        }
    }
}

