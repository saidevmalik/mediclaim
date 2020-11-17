pipeline {
   agent any
	environment {
       PATH = "/opt/maven3/bin:$PATH"
}
	stages {
      stage('Git Checkout') {
         steps {
            git 'https://github.com/saidevmalik/mediclaim.git'
		}
	}
		//stage('emailnotification'){
    //steps{
    //emailext body: 'test', subject: 'jobrun', to: 'saidevmalik123@gmail.com'
    //}
//}
		stage ('Build'){
       steps {
             sh 'mvn clean install'
}
}
	stage('SonarAnalysis')

    {steps {

       withSonarQubeEnv('sonar3') {

           sh 'mvn sonar:sonar \
  -Dsonar.projectKey=mediclaim \
  -Dsonar.host.url=http://104.211.117.31:9000 \
  -Dsonar.login=c784eaa201cb812a7f02be95550fce589fd306c9'   
      }
    }
 }
//stage("Quality Gate") {
  //          steps {
   //           timeout(time: 2, unit: 'MINUTES') {
     //           waitForQualityGate abortPipeline: false
       //       }
         //   }
          //} stage("Quality Gate") {
            steps {
                sh 'sleep 5s'
                timeout(time: 5, unit: 'MINUTES') {
                    script {
                        def result = waitForQualityGate()
                        if (result.status != 'OK') {
                            error "Pipeline aborted due to quality gate failure: ${result.status}"
                        } else {
                            echo "Quality gate passed with result: ${result.status}"
                        }
                    }
                }

            }
        }
		
		stage("email"){
			steps{
		mail bcc: '', body: 'Build is sucessful', cc: '', from: '', replyTo: '', subject: 'Build', to: 'saidevmalik123@gmail.com'
		}
		}

 stage('Publish Test Coverage Report') {
   steps {
      step([$class: 'JacocoPublisher', 
           execPattern: '**/build/jacoco/*.exec',
           classPattern: '**/build/classes',
           sourcePattern: 'src/main/java',
           exclusionPattern: 'src/test*'
           ])
          }
      }	
		stage ('Deploy') {
		steps {
			sh '/opt/maven3/bin/mvn clean deploy -Dmaven.test.skip=true'
		}
	}
		stage ('Release') {
		steps {
			sh 'export JENKINS_NODE_COOKIE=dontkillme ;nohup java -jar $WORKSPACE/target/*.jar &'
		}
	}
		//stage("email"){
		//	steps{
		//mail bcc: '', body: 'Build is sucessful', cc: '', from: '', replyTo: '', subject: 'Build', to: 'saidevmalik123@gmail.com'
		//}
		//}

}
}
