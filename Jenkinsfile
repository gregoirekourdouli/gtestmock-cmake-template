pipeline {
  agent any

  stages {
    stage('Clear') {
      steps {
        sh 'mkdir build'
      }
    }

    stage('CMake') {
      steps {
        dir(path: '${env.WORKSPACE}/build') {
          sh 'cmake ..'
        }

      }
    }

    stage('Build') {
      steps {
        dir(path: '${env.WORKSPACE}/build') {
          sh 'make'
        }

      }
    }

    stage('Test') {
      steps {
        pwd()
        dir(path: '${env.WORKSPACE}/build') {
          sh './tests --gtest_output="xml:test-results.xml"'
        }

      }
    }

    stage('Test Analysis') {
      steps {
        dir(path: '${env.WORKSPACE}/build') {
          junit 'test-results.xml'
        }

      }
    }

  }
}
