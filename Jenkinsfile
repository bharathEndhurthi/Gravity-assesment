pipeline {
    agent any

    environment {
        EC2_IP = "YOUR_EC2_PUBLIC_IP"
        SSH_KEY = credentials('your-ssh-key-credential-id')
        GIT_REPO = "https://github.com/your-repo/your-app.git"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: "${env.GIT_REPO}", branch: 'main'
            }
        }

        stage('Build') {
            steps {
                script {
                    // Add your build steps here
                    // For example, if using Node.js:
                    sh 'npm install'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Add your test steps here
                    // For example, if using Node.js:
                    sh 'npm test'
                }
            }
        }

        stage('Deploy') {
            steps {
                sshagent (credentials: ['your-ssh-key-credential-id']) {
                    script {
                        // Transfer application files to the EC2 instance
                        sh 'scp -o StrictHostKeyChecking=no -r * ubuntu@${env.EC2_IP}:/var/www/html'
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
