#### Installation,

Docker : https://docs.docker.com/engine/install/ubuntu/

`anup@ubuntu-2210-55-jenkins:~$ sudo apt-get remove docker docker-engine docker.io containerd runc`

    anup@ubuntu-2210-55-jenkins:~$ sudo apt-get install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
 
 <br>
 
`anup@ubuntu-2210-55-jenkins:~$ sudo mkdir -p /etc/apt/keyrings`

`anup@ubuntu-2210-55-jenkins:~$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg`

`anup@ubuntu-2210-55-jenkins:~$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \ 
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`

`anup@ubuntu-2210-55-jenkins:~$ sudo mkdir -p /etc/apt/keyrings`

`anup@ubuntu-2210-55-jenkins:~$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg`

<br>

`anup@ubuntu-2210-55-jenkins:~$ sudo apt-get update`

`anup@ubuntu-2210-55-jenkins:~$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin`

`anup@ubuntu-2210-55-jenkins:~$ sudo docker run hello-world`

`anup@ubuntu-2210-55-jenkins:~$ sudo docker info`

<br>

`anup@ubuntu-2210-55-jenkins:~$ sudo groupadd docker`

`anup@ubuntu-2210-55-jenkins:~$ sudo usermod -aG docker $USER`

`anup@ubuntu-2210-55-jenkins:~$ newgrp docker`

`anup@ubuntu-2210-55-jenkins:~$ docker info`

`anup@ubuntu-2210-55-jenkins:~$ docker run hello-world`

<br>

`anup@ubuntu-2210-55-jenkins:~$ sudo systemctl status docker.service `

`anup@ubuntu-2210-55-jenkins:~$ sudo systemctl enable docker.service `
