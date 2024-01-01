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
                    sh "docker login -u 21127520 -p 123456789"
                    sh "docker tag my-image:${env.BUILD_ID} 21127520/my-image:${env.BUILD_ID}"
                    sh "docker push 21127520/my-image:${env.BUILD_ID}"
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying..'
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