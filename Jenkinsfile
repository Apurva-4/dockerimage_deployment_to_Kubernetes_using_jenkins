pipeline {

  environment {
    dockerImage = ""
  }

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
      environment {
               registryCredential = 'docker-pass'
           }
      steps{
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
            sh 'docker push  2002456/httpd.'
          }
        }
      }
    }

    stage('Deploying App to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "deploymentservice.yaml", kubeconfigId: "mykube")
        }
      }
    }

  }

}