pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "abhilashgs14/jdg"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/vulcansmith-dev/J-D-G.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat ' "C:\\Users\\Admin\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" build -t %DOCKER_IMAGE%:latest .'
            }
        }

       stage('Login to Docker Hub') {
    steps {
        withCredentials([usernamePassword(
            credentialsId: 'dockerhub-PAT',
            usernameVariable: 'DOCKER_USER',
            passwordVariable: 'DOCKER_PAT'
        )]) {
            bat '''
                @echo off
                echo %DOCKER_PAT%| "C:\\Users\\Admin\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" login -u %DOCKER_USER% --password-stdin
                if errorlevel 1 exit /b 1
            '''
        }
    }
}

        stage('Push Docker Image') {
            steps {
                bat '"C:\\Users\\Admin\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" push %DOCKER_IMAGE%:latest'
            }
        }
    }

    post {
        success {
            echo 'Docker image built and pushed successfully.'
        }
        failure {
            echo 'Pipeline failed. Check Console Output.'
        }
    }
}
