pipeline {
    agent any  // This means that the pipeline can run on any available agent
    stages {
        stage ('build') {
            agent {
                docker {
                    image 'jenkins/inbound-agent:latest'
                    args '-u root'
                }
            }
            steps {
                echo 'Building the project in a Docker container'
            }
        }
        stage ('test') {
            steps {
                script {
                    def exitCode = sh(script: 'exit 1', returnStatus: true)
                    if (exitCode != 0) {
                        error "Test failed! Aborting pipeline."
                    }
                }
            }
        }
        stage ('deploy') {
            steps {
                script {
                    error "Forcing failure in deploy stage to test logs!"
                }
            }
        }
    }
    post {
        always {
            echo 'Pipeline complete'
        }
        failure {
            echo 'One or more builds have failed'
        }
        success {
            echo 'Pipeline was a success'
        }
    }
}
