pipeline {
  agent { label 'builder'}
  environment {
    ARTIFACTORY_CREDENTIALS = credentials('jfrog_artifactory_cred')
  }
   stages
  {
    stage('checkout')
    {
      steps{
        sh 'echo "Hello Good evening."'
      }
    }
    stage('build')
    {
      steps{
        sh 'mvn clean package'
        sh 'ls'
      }
    }
    stage('publish')
    {
      steps{
         |
          sh 'mkdir -p ~/.m2'
          sh 'echo "<settings>
                  <servers>
                    <server>
                      <id>hello-world-war</id>
                      <username>$ARTIFACTORY_CREDENTIALS_USR</username>
                      <password>$ARTIFACTORY_CREDENTIALS_PSW</password>
                    </server>
                  </servers>
                </settings>" > ~/.m2/settings.xml'
        sh 'mvn clean deploy'
        sh 'ls'
      }
    }
  }
}
        
