#### Installation,

Sonarqube : https://www.sonarqube.org/downloads/

`anup@ubuntu-2210-55-jenkins:~$ sudo apt-get install zip -y`

`anup@ubuntu-2210-55-jenkins:~$ sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.7.1.62043.zip`

`anup@ubuntu-2210-55-jenkins:~$ sudo unzip sonarqube-9.7.1.62043.zip `

`anup@ubuntu-2210-55-jenkins:~$ sudo mv sonarqube-9.7.1.62043 /opt/sonarqube`

<br>

`anup@ubuntu-2210-55-jenkins:~$ sudo groupadd sonar`

`anup@ubuntu-2210-55-jenkins:~$ sudo useradd -d /opt/sonarqube -g sonar sonar`

`anup@ubuntu-2210-55-jenkins:~$ sudo chown sonar:sonar /opt/sonarqube -R`

<br>

`anup@ubuntu-2210-55-jenkins:~$ sudo nano /opt/sonarqube/conf/sonar.properties`

    sonar.jdbc.username=sonar
    sonar.jdbc.password=2*hIskE3aLnh
    sonar.jdbc.url=jdbc:postgresql://localhost:5432/sonarqube
    
`anup@ubuntu-2210-55-jenkins:~$ sudo nano /etc/systemd/system/sonar.service`

    [Unit]
    
    Description=SonarQube service
    After=syslog.target network.target
    
    [Service]
    Type=forking
    
    ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
    ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
    
    User=sonar
    Group=sonar
    Restart=always
    
    LimitNOFILE=65536
    LimitNPROC=4096
    
    [Install]
    
    WantedBy=multi-user.target
  

`anup@ubuntu-2210-55-jenkins:~$ sudo systemctl enable sonar`

`anup@ubuntu-2210-55-jenkins:~$ sudo systemctl start sonar`

`anup@ubuntu-2210-55-jenkins:~$ sudo systemctl status sonar`


#### Modify Kernel System Limits,

`anup@ubuntu-2210-55-jenkins:~$ sudo nano /etc/sysctl.conf`

Add the following lines.

    vm.max_map_count=262144
    
    fs.file-max=65536
    
    ulimit -n 65536
    
    ulimit -u 4096
    
    
Access SonarQube Web Interface,

http://192.168.56.55:9000/

Log in with username admin and password admin (2*hIskE3aLnh)

