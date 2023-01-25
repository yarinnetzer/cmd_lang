Please create a job in jenkins and pull this repository.
After you run the job with a parameter it finds the Jenkinsfile and 
changes the index.html file.
After that it moves the index file, the Dockerfile and the run_apache 
script to jenkins_home/yarin_project directory within your local machine.

All you have to do, is run the script by typing: sh run_apache.sh
