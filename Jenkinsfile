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
                subject: "Jenkins Build ${currentBuild.fullDisplayName} - Unstable",
                body: """<p>Build ${currentBuild.fullDisplayName} is unstable.</p>
                         <p>Check console output at "${env.Build_URL} to view the results.</p>""",
            )
        }
    }
}
    
