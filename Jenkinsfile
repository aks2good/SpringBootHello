def groovyScript1

//start of pipeline
pipeline {
    agent any
    environment {
    	// you can define here if you want access across many stages
    	// you can chose to define in stages if its stage specific env variable
        BUILD_VERSION = '1.0.0'
        //SERVER_CREDENTIALS = credentials('my-server-credentails')
    }
    //tools {
        // you can define tools used in build here such as mvn, gradle, jdk (currently supported)
        // local jenkins -> global tool configuation
        //maven 'Maven'
    //}
    parameters {
        booleanParam(name: 'executeBuild', defaultValue: true, description: 'should we execute the build')
        choice(name: 'choices', choices: [ '1', '2', '3' ], description: '')
        string(name: 'deployerName', defaultValue: 'Axman', description: '')
    }
    //triggers {
    //    
    //}
    stages {
    	stage('Init') {
    		steps {
				// you can write rest of logic below in the groovy script as well to 
    			// keep this main file clean 
            	script {
                	groovyScript1 = load "initialScript.groovy"
                	groovyScript1.initialize()
            	}
		    }
        }
        stage('Build') { 
            steps {
                echo "Build Stage has started...."
                echo "Deployer Name : ${params.deployerName}"
                echo "Building Version : ${BUILD_VERSION}...." 
            }
        }
        stage('Test') {
        	when{
            	expression {
               		env.BRANCH_NAME == 'dev' || env.BRANCH_NAME == 'master'
            	}
        	}
            steps {
                echo "Test Stage has started...." 
            }
        }
        stage('Deploy') { 
            steps {
                echo "Deploy Stage has started...."
                //withCredentails([
                //usernamePassword(credentials: 'my-server-credentails', usernameVariable: USER, passwordVariable: PASSWORD)]){
				//echo "Deploy Stage using credentails User : ${USER} and Password : ${PASSWORD}"	
                //} 
            }
        }
    } 
}
   
node {
	// groovy script to be inserted here
}


//post {
    // this executes after all the stages are done
//    always {
        // this always gets executed
//    }
//    success {
        // executes in case of success
//    }
//    failure {
        // executes in case of failure
//    }
//}



