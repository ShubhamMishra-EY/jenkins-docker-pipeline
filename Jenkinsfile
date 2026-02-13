pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository containing the calculator app
               checkout scm // Replace with your actual repository URL
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t shubham-python .'
                }
            }
        }

        stage('Delete Existing Containers') {
            steps {
                script {
                    // Stop and remove existing containers named shubham-python
                    sh '''
                    if [ "$(docker ps -q -f name=shubham-python)" ]; then
                        docker stop shubham-python
                        docker rm shubham-python
                    fi
                    '''
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container
                    sh 'docker run -d --name shubham-python -p 85:5000 shubham-python'
                }
            }
        }
    }

    post {
        always {
            // Clean up Docker images and containers if needed
            sh 'docker system prune -f'
        }
    }
}
