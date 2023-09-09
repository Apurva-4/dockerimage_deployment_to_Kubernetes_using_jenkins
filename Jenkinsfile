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
          withDockerRegistry(credentialsId: 'docker-pass')
          {
            sh 'docker push  2002456/httpd'
          }
        }
      }
    }

    stage('Deploying App to Kubernetes') {
      steps {
        script {
          kubernetesDeploy (config: 'deploymentservice.yaml', kubeconfigId:'mykube')
          {
          sh 'kubectl set image deployment/httpd-deployment httpd-app=2002456/httpd'
          }
        }
      }
    }

  }

}