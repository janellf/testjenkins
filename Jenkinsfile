pipeline {
    agent {
        docker {
            image 'jenkins/inbound-agent:latest' 
            args '-u root'
        }
    }
    stages {
        stage ('build') {
            steps {
                echo 'yeah buddy'
            }
        }
        stage ('test') {
            steps {
                script {
                    def exitCode = sh(script: 'exit 1', returnStatus: true)
                    if (exitCode != 0) {
                        echo "Test failed with exit code: ${exitCode}"
                    }
                }
            }
        }
        stage ('deploy') {
            steps {
                echo 'GOD got me'
            }
        }
    }
    post {
        always {
            echo 'pipeline complete'
        }
        failure {
            echo 'one or more builds have failed'
        }
        success {
            echo 'pipeline was a success'
        }
    }
}
