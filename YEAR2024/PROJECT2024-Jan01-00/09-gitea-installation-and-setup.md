#### Installation and setup,


https://gitea.io/en-us/ , https://dl.gitea.io/gitea/

#### We’ll use SQLite,

`anup@ubuntu-2210-55-jenkins:~$ sudo apt update`

`anup@ubuntu-2210-55-jenkins:~$ sudo apt install sqlite3`

`anup@ubuntu-2210-55-jenkins:~$ sqlite3 --version`

`anup@ubuntu-2210-55-jenkins:~$ git --version`

    anup@ubuntu-2210-55-jenkins:~$ sudo adduser \
       --system \
       --shell /bin/bash \
       --gecos 'Git Version Control' \
       --group \
       --disabled-password \
       --home /home/git \
       git

<br>

`anup@ubuntu-2210-55-jenkins:~$ VERSION=1.17.3`

`anup@ubuntu-2210-55-jenkins:~$ sudo wget -O /tmp/gitea https://dl.gitea.io/gitea/${VERSION}/gitea-${VERSION}-linux-amd64`

`anup@ubuntu-2210-55-jenkins:~$ ls -ltr /tmp/`

`anup@ubuntu-2210-55-jenkins:~$ sudo mv /tmp/gitea /usr/local/bin`

`anup@ubuntu-2210-55-jenkins:~$ sudo chmod +x /usr/local/bin/gitea`

<br>

`anup@ubuntu-2210-55-jenkins:~$ sudo mkdir -p /var/lib/gitea/{custom,data,log}`

`anup@ubuntu-2210-55-jenkins:~$ sudo chown -R git:git /var/lib/gitea/`

`anup@ubuntu-2210-55-jenkins:~$ sudo chmod -R 750 /var/lib/gitea/`

`anup@ubuntu-2210-55-jenkins:~$ sudo mkdir /etc/gitea`

`anup@ubuntu-2210-55-jenkins:~$ sudo chown root:git /etc/gitea`

`anup@ubuntu-2210-55-jenkins:~$ sudo chmod 770 /etc/gitea`

<br>

#### Create a Systemd Unit File,

`anup@ubuntu-2210-55-jenkins:~$ sudo wget https://raw.githubusercontent.com/go-gitea/gitea/main/contrib/systemd/gitea.service -P /etc/systemd/system/`

`anup@ubuntu-2210-55-jenkins:~$ sudo systemctl daemon-reload`

`anup@ubuntu-2210-55-jenkins:~$ sudo systemctl enable --now gitea`

`anup@ubuntu-2210-55-jenkins:~$ sudo systemctl status gitea`

`anup@ubuntu-2210-55-jenkins:~$ sudo systemctl enable gitea`

http://192.168.56.55:3000/

You can change the settings at any time by editing the Gitea configuration file.

`root@ubuntu-2210-55-jenkins:/home/anup# cd /etc/gitea/`

`root@ubuntu-2210-55-jenkins:/etc/gitea# nano app.ini `

    ROOT_URL         = http://192.168.56.55:3000/
    
    [webhook]
    ALLOWED_HOST_LIST = 192.168.56.55/24

anup@ubuntu-2210-55-jenkins:~$ sudo systemctl restart gitea

http://192.168.56.55:3000/

“Need an account? Register now.” link
ID : anuniqs
Password : 2*hIskE3aLnh

<br>
