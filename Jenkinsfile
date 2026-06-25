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
                subject: "Build Unstable - ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: 'The build is unstable.\nJob: ${env.JOB_NAME}\nBuild Number: ${env.BUILD_NUMBER}\nBuild URL: ${env.BUILD_URL}'
            )
        }
    }
}
    
