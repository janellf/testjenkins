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
    
