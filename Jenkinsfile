pipeline {

  agent {label "docker"}

  stages {

    stage('Checkout Source') {
      steps {
        git 'https://github.com/Apurva-4/dockerimage_deployment_to_Kubernetes_using_jenkins.git'
      }
    }

    stage('Build image') {
      steps{
        script {
          sh 'docker build -t 2002456/httpd .'
        }
      }
    }

    stage('Pushing Image') {
      steps{
        script {
          withDockerRegistry(credentialsId: 'dockerhub')
          {
            sh 'docker push  2002456/httpd'
          }
        }
      }
    }

  }

}