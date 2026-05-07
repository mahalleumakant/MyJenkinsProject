pipeline 
agent any
stages {
    stage('check python version') {
        steps {
            echo 'checking python version...'
            sh 'python --version'
        }
    }
    stage('Running python script') {
        steps {
            echo 'Running python script...'
            sh 'python helloworld.py'
        }
    }
    
    }
