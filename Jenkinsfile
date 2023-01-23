pipeline {
    agent any
    parameters {
        choice(
            name: 'CMD_Lang',
            choices: ['ALL','JAVA','PYTHON','C'],
            description: 'select cmd language' )
    }
    stages{
        stage('Clone sources') {
            steps {
                git url: 'https://github.com/yarinnetzer/cmd_lang.git', branch: 'main'
                sh ''' if [ '''+ params.CMD_Lang +''' = "ALL" ]
                then
                cat JAVA PYTHON C
                else
                cat '''+ params.CMD_Lang +'''
                fi
                echo "Sending result to given email..."
                '''
            }
        }
        stage('sending email') {
            steps {
                script {
                    switch(params.CMD_Lang) {
                        case "ALL": emailext body: 'The user CMD language choice is: JAVA, PYTHON, C (all the above)',
                                    subject: 'User CMD language choice',
                                    to: 'netzer.yarin@gmail.com'; break
                        default: emailext body: 'The user CMD language choice is: '+ params.CMD_Lang,
                                 subject: 'User CMD language choice',
                                 to: 'netzer.yarin@gmail.com'; break
                    }
                }
            }
        }
        stage('Run docker apache container') {
            steps {
                sh "sed -i s/CHOICE/${params.CMD_Lang}/ /data/index.html"
                sh "docker run -dit --name apache-app -p 8089:80 -v /Users/yarin/workspace/RealTimeCollege/docker_class/finalproject:/usr/local/apache2/htdocs/ httpd:2.4"
                }
            }
        }
    }
