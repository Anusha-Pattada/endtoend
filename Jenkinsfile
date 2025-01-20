pipeline {
    agent any

    environment {
        //IMAGE_NAME = 'helloworld-java'
        REGISTRY = 'https://hub.docker.com/repositories/anushapj28'  // e.g., DockerHub or private registry
        //DOCKER_IMAGE = "${REGISTRY}/${IMAGE_NAME}:latest"
        //DOCKER_IMAGE = "${REGISTRY}/${IMAGE_NAME}"
        REGISTRY_URL = 'https://index.docker.io/v1/'
        IMAGE_NAME = 'anushapj28/helloworld-java'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('build') {
            steps {
                sh "mvn compile"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                   //docker build("${DOCKER_IMAGE}")
                    //sudo docker build -t anushapj28/helloworld-java:tag123 .
                    docker.build("${IMAGE_NAME}:latest")
                }
            }
        }

        stage('Push Docker Image to Registry') {
            steps {
                script {
                    //docker.withRegistry('', 'docker') {
                        //docker.image("${IMAGE_NAME}").push()
                      docker.withRegistry(REGISTRY_URL, 'dockerhub-credentials') {
                        docker.image("${IMAGE_NAME}:latest").push()
                    }
                }
            }
        }

        stage('Deploy to Tomcat with Ansible') {
            steps {
                script {
                    //sh "sudo ansible-playbook -i inventory.ini -vvv deploy.yaml"
                    sh "ansible-playbook -i inventory.ini --private-key=~/.ssh/id_ed25519 deploy.yaml"

                }
            }
        }
    }
}
