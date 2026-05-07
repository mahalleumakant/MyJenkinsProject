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
            sh 'docker build -t docker.io/mahalleumakant/helloworld:latest .'
        }
    }
        stage('pushing docker image') {
            steps {
                echo 'pushing docker image...'
                sh 'docker push docker.io/mahalleumakant/helloworld:latest'
            }
        }
        stage('container deployment') {
            steps {
                echo 'deploying container...'
                sh 'docker run -d --name helloworld docker.io/mahalleumakant/helloworld:latest'
            }
        }
    
    }
}
