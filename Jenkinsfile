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
    stage('deploy')
    {
      agent { label 'deployer'}
      steps{
        sh 'curl -L -u "${ARTIFACTORY_CREDENTIALS_USR}:${ARTIFACTORY_CREDENTIALS_PSW}" -O "http://3.110.218.254:8082/artifactory/helloworldwar-cicd-libs-release/com/efsavage/hello-world-war/$BUILD_NUMBER/hello-world-war-$BUILD_NUMBER.war"'
        sh 'ls'
        sh 'sudo cp hello-world-war-$BUILD_NUMBER.war /opt/tomcat/apache-tomcat-10.1.34/webapps/'
        sh 'sudo bash /opt/tomcat/apache-tomcat-10.1.34/bin/shutdown.sh'
        sh 'sleep 20'
        sh 'sudo bash /opt/tomcat/apache-tomcat-10.1.34/bin/startup.sh'
        
  }
}
}
}
        
