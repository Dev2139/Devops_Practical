pipeline {
    agent any

    environment {
        APP_NAME = 'crud-app'
    }

    stages {

        stage('Clone Code') {
            steps {
                echo 'Cloning from GitHub...'
                git 'https://github.com/Dev2139/Devops_Practical.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building project using Maven...'
                bat 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                echo 'Running test cases...'
                bat 'mvn test'
            }
        }

        stage('Package') {
            steps {
                echo 'Generating JAR file...'
                bat 'mvn package'
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