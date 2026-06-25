pipeline {
<<<<<<< HEAD
    agent any

    parameters {
        string(name: 'encounterId', defaultValue: 'ENC-TEST-001', description: 'Encounter ID to archive')
        booleanParam(name: 'dryRun', defaultValue: true, description: 'If true, simulates without making changes')
    }

    stages {
        stage('Archive Census Data Events') {
            steps {
                sh """
                    curl -S \
                    -H "Accept: application/json" \
                    -H "Content-Type: application/json" \
                    -X POST \
                    "https://httpbin.org/post?encounterId=${params.encounterId}&dryRun=${params.dryRun}"
                """
            }
        }
    }

    post {
        unstable {
            emailext(
                to: 'sarajayjoyner@gmail.com',
                subject: 'Build Unstable',
                body: 'The build is unstable.'
            )
        }
    }
    
=======
    agent any  // Use any available agent globally
    stages {
        stage ('build') {
            steps {
                    image 'jenkins/inbound-agent:latest'
                    args '-u root'
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
>>>>>>> 6f0f157f8f12f568d187a4b1c6d998ca5acb13a7
