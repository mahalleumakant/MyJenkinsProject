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
                    credentialsId: 'dockerhub',
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
                sh 'docker run -d --name HelloWorldMsg docker.io/umahalle/helloworld:latest'
            }
        }
        
        if success() {
            stage('notify success') {
                steps {
                    echo 'Build and deployment successful!'
                }
            }
        }
            else {
                stage('notify failure') {
                    steps {
                        echo 'Build or deployment failed.'
                    }
                }
            }
        
    
    }
}
