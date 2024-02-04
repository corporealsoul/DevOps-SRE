
### Instalaltion,

Jenkins : https://www.jenkins.io/doc/book/installing/linux/#debianubuntu

`anup@ubuntu-2210-55-jenkins:~$ curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null`

`anup@ubuntu-2210-55-jenkins:~$ echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null`

`anup@ubuntu-2210-55-jenkins:~$ sudo apt-get update`

`anup@ubuntu-2210-55-jenkins:~$ sudo apt-get install jenkins`

<br>

`anup@ubuntu-2210-55-jenkins:~$ sudo systemctl status jenkins.service `

`anup@ubuntu-2210-55-jenkins:~$ sudo systemctl enable jenkins.service `

`anup@ubuntu-2210-55-jenkins:~$ sudo cat /var/lib/jenkins/secrets/initialAdminPassword`

    d6abe37af7764c159bd241a151b91acb

On Browser : http://192.168.56.55:8080/


### Credentials,

Id : anuniqs,

Pass : 2*hIskE3aLnh
