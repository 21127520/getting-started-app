pipeline {
    agent any

    environment {
                HOME = "${env.WORKSPACE}"
        }

    stages {
        stage('Build') {
            steps {
                script {
                    echo 'Building Docker Image...'
                    dockerImage = docker.build("my-image:${env.BUILD_ID}")
                }
            }
        }
        stage('Publish') {
             steps {
                script {
                    echo 'Publishing Docker Image...'
                    sh "docker login -u nhtlan21@clc.fitus.edu.vn -p 123456789"
                    sh "docker tag my-image:${env.BUILD_ID} 21127520/my-image:${env.BUILD_ID}"
                    sh "docker push 21127520/my-image:${env.BUILD_ID}"
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    echo 'Deploying...'
                    //sh "docker rm -f my-app || true"
                    sh "docker run -d -p 8081:8081 --name=my-app 21127520/my-image:${env.BUILD_ID}"
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