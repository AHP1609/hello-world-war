pipeline {
  agent { label 'builder'}
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
  }
}
        
