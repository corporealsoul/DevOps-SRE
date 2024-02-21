#### Installation, 1

Maven : https://maven.apache.org/download.cgi

`anup@ubuntu-2210-55-jenkins:~$ wget https://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz`

`anup@ubuntu-2210-55-jenkins:~$ tar -xvf apache-maven-3.6.3-bin.tar.gz`

`anup@ubuntu-2210-55-jenkins:~$ sudo mv apache-maven-3.6.3 /opt/`


#### Setting the M2_HOME Environment Variable,

`anup@ubuntu-2210-55-jenkins:~$ M2_HOME='/opt/apache-maven-3.6.3'`

`anup@ubuntu-2210-55-jenkins:~$ PATH="$M2_HOME/bin:$PATH"`

`anup@ubuntu-2210-55-jenkins:~$ export PATH`

<br>

`anup@ubuntu-2210-55-jenkins:~$ echo $M2_HOME`

`anup@ubuntu-2210-55-jenkins:~$ echo $PATH`

<br>

`anup@ubuntu-2210-55-jenkins:~$ mvn -version`


#### Installation, 2

`anup@ubuntu-2210-55-jenkins:~/labs$ sudo apt install maven`

`anup@ubuntu-2210-55-jenkins:~/labs$ mvn --version`

`anup@ubuntu-2210-55-jenkins:~/labs$ sudo nano ~/.profile`

    # set PATH for maven build
    export M2_HOME=/usr/share/maven
    export PATH=$PATH:/usr/share/maven/bin

`anup@ubuntu-2210-55-jenkins:~/labs$ source ~/.profile`


#### Code and commands,

              mvn archetype:generate -DgroupId=com.devops -DartifactId=Demo1 -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
              mvn archetype:generate -DgroupId=com.devops -DartifactId=Demo2 -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false

#### Sonarqube Anaylsis Properties to be added in Jenkins Job for code quality,

              sonar.projectKey=my:Project
              sonar.projectName=Myprojname:$BUILD_NUMBER
              sonar.projectVersion=1.0
              sonar.language=java
              sonar.sources=src/main/java

#### To deploy artifacts with Build number,

    In pom.xml: <version>1.2.${​​​​​​​​​v}​​​​​​​​​-SNAPSHOT</version>
    In mvn build:  clean install -Dv=${​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​BUILD_NUMBER}​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​
