pipeline {
    agent any

    environment {
        APP_NAME = 'crud-app'
        // Define the path to the Maven executable in your project
        MVN_CMD = ".maven\\apache-maven-3.9.15\\bin\\mvn.cmd"
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building project using local Maven...'
                bat "${env.MVN_CMD} clean compile"
            }
        }

        stage('Test') {
            steps {
                echo 'Running test cases...'
                bat "${env.MVN_CMD} test"
            }
        }

        stage('Package') {
            steps {
                echo 'Generating JAR file...'
                bat "${env.MVN_CMD} package -DskipTests"
            }
        }

        stage('Archive') {
            steps {
                echo 'Archiving build artifact...'
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
    }

    post {
        success {
            echo 'Build Successful ✅'
        }
        failure {
            echo 'Build Failed ❌'
        }
    }
}