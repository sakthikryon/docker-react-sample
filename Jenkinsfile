node {
  try {
    stage('Checkout') {
      checkout scm
    }
    stage('Environment') {
      sh 'git --version'
      echo "Branch: ${env.BRANCH_NAME}"
      sh 'docker -v'
      sh 'printenv'
    }
    stage('Build Docker test'){
     sh 'docker build -t react-test -f Dockerfile.test --no-cache .'
    }
    stage('Docker test'){
      sh 'docker run --rm react-test'
    }
    stage('Clean Docker test'){
      sh 'docker rmi react-test'
    }
    stage('Deploy'){
      if(env.BRANCH_NAME == 'main'){
        sh 'docker build -t react-app --no-cache .'
        sh 'docker tag react-app localhost:5000'
        sh 'docker push localhost:5000'
        sh 'docker rmi -f react-app localhost:5000'
      }
    }
  }
  catch (err) {
    throw err
  }
}
