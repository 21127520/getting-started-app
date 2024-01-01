pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    dockerImage = docker.build("my-image:${env.BUILD_ID}")
                    echo 'Building Docker Image..'
                }
            }
        }
        stage('Publish') {
             steps {
                script {
                    echo 'Publishing Docker Image...'
                    sh "sudo docker login -u nhtlan21@clc.fitus.edu.vn -p 123456789"
                    sh "sudo docker tag my-image:${env.BUILD_ID} nhtlan21@clc.fitus.edu.vn/my-image:${env.BUILD_ID}"
                    sh "sudo docker push nhtlan21@clc.fitus.edu.vn/my-image:${env.BUILD_ID}"
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
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