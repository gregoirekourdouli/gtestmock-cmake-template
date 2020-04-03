pipeline {
  agent any
  stages {
    stage('Clear') {
      steps {
        sh 'rm -r build'
        sh 'mkdir build'
      }
    }

    stage('CMake') {
      steps {
        dir(path: '$pwd/build') {
          sh 'cmake ..'
        }

      }
    }

    stage('Build') {
      steps {
        dir(path: '$pwd/build') {
          sh 'make'
        }

      }
    }

    stage('Test') {
      steps {
        pwd()
        dir(path: '$pwd/build') {
          sh './tests --gtest_output="xml:test-results.xml"'
        }

      }
    }

    stage('Test Analysis') {
      steps {
        dir(path: '$pwd/build') {
          junit 'test-results.xml'
        }

      }
    }

  }
}