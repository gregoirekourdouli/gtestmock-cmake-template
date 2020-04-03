pipeline {
  agent any

  def current_dir=${env.WORKSPACE}

  stages {
    stage('Clear') {
      steps {
        sh 'mkdir build'
      }
    }

    stage('CMake') {
      steps {
        dir(path: current_dir+'/build') {
          sh 'cmake ..'
        }

      }
    }

    stage('Build') {
      steps {
        dir(path: current_dir+'/build') {
          sh 'make'
        }

      }
    }

    stage('Test') {
      steps {
        pwd()
        dir(path: current_dir+'/build') {
          sh './tests --gtest_output="xml:test-results.xml"'
        }

      }
    }

    stage('Test Analysis') {
      steps {
        dir(path: current_dir+'/build') {
          junit 'test-results.xml'
        }

      }
    }

  }
}
