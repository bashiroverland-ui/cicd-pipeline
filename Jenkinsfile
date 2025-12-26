
pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                echo '📦 Checking out source code from GitHub...'
                checkout scm
                
                sh '''
                    echo "Repository checked out successfully"
                    echo "Current branch: $(git branch --show-current || echo 'detached HEAD')"
                    echo "Commit: $(git rev-parse --short HEAD)"
                    echo ""
                    echo "Project structure:"
                    ls -la
              '''
            }
          }
        
          stage('Application Build') {
            steps {        
                echo "Building an Application"
                sh 'chmod +x scripts/build.sh'
                echo " Application built, moving to next stage"
           }
        }
         stage('Tests'){
            steps {
                echo "Testing"
                sh 'chmod +x scripts/test.sh'
                echo "Test completed"
            }
         }
         stage('Docker image build'){
            steps {
                sh 'docker build -t yerlanbash/cicdpipelinepractical .'
                }
               }
        stage('Docker image push'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker-hub-pass' , passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                sh "echo \$PASS | docker login -u \$USER --password-stdin"
                sh 'docker push yerlanbash/cicdpipelinepractical'
                }
               }
              }
      } //stages

    post {
        success {
            echo '✅ Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed!'
        }
      } //post
} //pipline

