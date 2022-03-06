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
        }
        stage('Deploy to the tomcat'){
            steps{
                script{
                     deploy adapters: [tomcat9(credentialsId: 'tomcat9', path: '', url: 'http://13.233.247.23:8080')], contextPath: 'testapp', war: '**/*.war'
                }
            }
        }
        stage('building docker image'){
            steps{
                script{
                        sh 'docker build -t riyansh16/paytmbus:$BUILD_NUMBER .'
                        withCredentials([string(credentialsId: 'docker', variable: 'docker-password')]) {
                               sh 'cat /home/ubuntu/my_password.txt | docker login --username riyansh16 --password-stdin'
                               sh 'docker push riyansh16/paytmbus:$BUILD_NUMBER'
                         }
                 }
            }
        }
    }
}
