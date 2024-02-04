#### Application, maven-project-take1, 

`anup@ubuntu-2210-55-jenkins:~/labs$ mvn archetype:generate -DgroupId=com.devops -DartifactId=maven-project-take1 -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false`

`anup@ubuntu-2210-55-jenkins:~/labs/maven-project-take1$ tree`

`anup@ubuntu-2210-55-jenkins:~/labs/maven-project-take1$ mvn clean`

`anup@ubuntu-2210-55-jenkins:~/labs/maven-project-take1$ mvn clean compile`

`anup@ubuntu-2210-55-jenkins:~/labs/maven-project-take1$ mvn clean test`

`anup@ubuntu-2210-55-jenkins:~/labs/maven-project-take1$ mvn clean verify `

`anup@ubuntu-2210-55-jenkins:~/labs/maven-project-take1$ mvn clean install`

`anup@ubuntu-2210-55-jenkins:~/labs/maven-project-take1$ mvn clean deploy`

<br>

#### Code,

`anup@ubuntu-2210-55-jenkins:~/labs/maven-project-take1/src/main/java/com/devops$ cat App.java` 

<br>

#### Git control,

`anup@ubuntu-2210-55-jenkins:~/labs/maven-project-take1$ touch README.md`

`anup@ubuntu-2210-55-jenkins:~/labs/maven-project-take1$ git init`

`anup@ubuntu-2210-55-jenkins:~/labs/maven-project-take1$ git checkout -b main`

`anup@ubuntu-2210-55-jenkins:~/labs/maven-project-take1$ git add README.md`

`anup@ubuntu-2210-55-jenkins:~/labs/maven-project-take1$ git commit -m "first commit"`

`anup@ubuntu-2210-55-jenkins:~/labs/maven-project-take1$ git remote add origin http://192.168.56.55:3000/anuniqs/maven-project-take1.git`

`anup@ubuntu-2210-55-jenkins:~/labs/maven-project-take1$ git push -u origin main`
