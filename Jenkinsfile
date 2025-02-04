pipeline {
  agent none
  environment {
    ARTIFACTORY_CREDENTIALS = credentials('jfrog_artifactory_cred')
  }
   stages
  {
    stage('checkout')
    {
      agent { label 'builder'}
      steps{
        sh 'echo "Hello Good evening."'
      }
    }
    stage('build')
    {
      agent { label 'builder'}
      steps{
        sh 'mvn clean package'
        sh 'ls'
      }
    }
    stage('publish')
    {
      agent { label 'builder'}
      steps{
        sh 'mkdir -p ~/.m2'
          sh '''echo "<settings>
                  <servers>
                    <server>
                      <id>hello-world-war</id>
                      <username>$ARTIFACTORY_CREDENTIALS_USR</username>
                      <password>$ARTIFACTORY_CREDENTIALS_PSW</password>
                    </server>
                  </servers>
                </settings>" > ~/.m2/settings.xml'''
        sh 'cat ~/.m2/settings.xml'
        sh 'mvn clean deploy'
        sh 'ls'
      }
    }
  }
}
        
