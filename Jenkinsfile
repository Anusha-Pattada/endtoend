pipeline {
    agent any

    environment {
        IMAGE_NAME = 'helloworld-java'
        REGISTRY = 'https://hub.docker.com/repositories/anushapj28'  // e.g., DockerHub or private registry
        DOCKER_IMAGE = "${REGISTRY}/${IMAGE_NAME}:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Push Docker Image to Registry') {
            steps {
                script {
                    docker.withRegistry('', 'docker-credentials') {
                        docker.image("${DOCKER_IMAGE}").push()
                    }
                }
            }
        }

        stage('Deploy to Tomcat with Ansible') {
            steps {
                script {
                    sh "ansible-playbook -i inventory/hosts deploy.yml"
                }
            }
        }
    }
}
