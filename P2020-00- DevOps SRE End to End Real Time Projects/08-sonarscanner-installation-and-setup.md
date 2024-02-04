#### Setting Up the Code Scanner,

https://binaries.sonarsource.com/?prefix=Distribution/sonar-scanner-cli/

`anup@ubuntu-2210-55-jenkins:~$ sudo mkdir /opt/sonarscanner`

`anup@ubuntu-2210-55-jenkins:~$ cd /opt/sonarscanner/`

<br>

`anup@ubuntu-2210-55-jenkins:/opt/sonarscanner$ sudo wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.7.0.2747-linux.zip`

`anup@ubuntu-2210-55-jenkins:/opt/sonarscanner$ sudo unzip sonar-scanner-cli-4.7.0.2747-linux.zip `

`anup@ubuntu-2210-55-jenkins:/opt/sonarscanner$ sudo nano sonar-scanner-4.7.0.2747-linux/conf/sonar-scanner.properties `

    sonar.host.url=http://192.168.56.55:9000/

`anup@ubuntu-2210-55-jenkins:/opt/sonarscanner$ sudo chmod +x sonar-scanner-4.7.0.2747-linux/bin/sonar-scanner`

`anup@ubuntu-2210-55-jenkins:/opt/sonarscanner$ sudo ln -s /opt/sonarscanner/sonar-scanner-4.7.0.2747-linux/bin/sonar-scanner /usr/local/bin/sonar-scanner`

<br>

Create a test case with the help of internet !

<br>
