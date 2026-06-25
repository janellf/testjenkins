pipeline {
    
    agent any

    parameters {
        string(name: 'encounterId', defaultValue: '', description: '')
        booleanParam(name: 'dryRun', defaultValue: true, description: '')
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
                unstable(message: 'Forcing unstable for test')
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
}
    
