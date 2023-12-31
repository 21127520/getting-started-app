pipeline {
    agent any

    environment {
        DOCKER_CREDENTIAL_ID = '21127520_docker'
        DOCKERHUB_ACCOUNT = '21127520'
        IMAGE_NAME = '21127520-21127732'
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                script {
                    docker.build("${DOCKERHUB_ACCOUNT}/${IMAGE_NAME}:your_tag")
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'DOCKER_CREDENTIAL_ID') {
                        docker.image("${DOCKERHUB_ACCOUNT}/${IMAGE_NAME}:your_tag").push()
                    }
                }
            }
        }
    }
    post {
        success {
            echo "SUCCESSFUL"
        }
        failure {
            echo "FAILED"
        }
    }
}