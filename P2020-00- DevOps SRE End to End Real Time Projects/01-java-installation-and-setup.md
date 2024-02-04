### Installation,

Java : [https://www.jenkins.io/doc/book/installing/linux/#debianubuntu](https://www.jenkins.io/doc/book/installing/linux/#debianubuntu)

`anup@ubuntu-2210-55-jenkins:~$ sudo apt update`  

`anup@ubuntu-2210-55-jenkins:~$ sudo apt install openjdk-11-jre`

<br>  

`anup@ubuntu-2210-55-jenkins:~$ java --version`  

`anup@ubuntu-2210-55-jenkins:~$ sudo update-java-alternatives --list`  

`anup@ubuntu-2210-55-jenkins:~$ sudo update-alternatives --config java`

<br>

`anup@ubuntu-2210-55-jenkins:~/labs$ which java` 

`anup@ubuntu-2210-55-jenkins:~/labs$ ls -ltr /usr/bin/java`  

`anup@ubuntu-2210-55-jenkins:~/labs$ ls -ltr /etc/alternatives/java`

### Setting the JAVA_HOME Environment Variable,

#### Temporary,

`anup@ubuntu-2210-55-jenkins:~$ JAVA_HOME="/usr/lib/jvm/java-1.11.0-openjdk-amd64"`  

`anup@ubuntu-2210-55-jenkins:~$ PATH="$JAVA_HOME/bin:$PATH"`  

`anup@ubuntu-2210-55-jenkins:~$ echo $JAVA_HOME`  

`anup@ubuntu-2210-55-jenkins:~$ echo $PATH`

#### Permanent,

`anup@ubuntu-2210-55-jenkins:~$ sudo nano ~/.profile`

```
# set PATH for JAVA
export JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64 
export PATH=$PATH:/usr/lib/jvm/java-1.11.0-openjdk-amd64/bin
```

`anup@ubuntu-2210-55-jenkins:~$ source ~/.profile`

<br>
