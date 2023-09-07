pipeline {

  environment {
    dockerimagename = "2002456/httpd"
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
          dockerImage = docker.build dockerimagename
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
            dockerImage.push("V2")
          }
        }
      }
    }

    stage('Deploying App to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "deploymentservice.yml", kubeconfigId: "mykube")
        }
      }
    }

  }

}