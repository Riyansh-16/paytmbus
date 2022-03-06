pipeline{
    agent any 
    stages{
        stage('code checkout'){
            steps{
                git 'https://github.com/Riyansh-16/paytmbus.git'
            }
        }
        stage('build the code'){
            steps{
                sh 'mvn clean package'
            }
        }stage('Deploy to the tomcat'){
            steps{
               deploy adapters: [tomcat9(credentialsId: 'tomcat9', path: '', url: 'http://13.233.247.23:8080')], contextPath: 'testapp', war: '**/*.war'
            }
        }
    }
}
