pipeline {
agent any
stages {
    stage('check python version') {
        steps {
            echo 'checking python version...'
            sh 'python3 --version'
        }
    }
    stage('Running python script') {
        steps {
            echo 'Running python script...'
            sh 'python3 helloworld.py'
        }
    }
    stage('buiding docker image') {
        steps {
            echo 'building docker image...'
            sh 'docker build -t docker.io/umahalle/helloworld:latest .'
        }
    }
     stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-cred',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {

                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }
        stage('pushing docker image') {
            steps {
                echo 'pushing docker image...'
                sh 'docker push docker.io/umahalle/helloworld:latest'
            }
        }
        stage('container deployment') {
            steps {
                echo 'deploying container...'
                sh 'docker run -d docker.io/umahalle/helloworld:latest'
            }
        }
        
    }
     post {
        success {
            echo 'Build and deployment successful!'
        }
        failure {
            echo 'Build or deployment failed.'
        }
    }
}
