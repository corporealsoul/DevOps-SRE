#### Install and Configure PostgreSQL : 

`anup@ubuntu-2210-55-jenkins:~$ sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ lsb_release -cs-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'`

`anup@ubuntu-2210-55-jenkins:~$ wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -`

`anup@ubuntu-2210-55-jenkins:~$ sudo apt install postgresql postgresql-contrib -y`

`anup@ubuntu-2210-55-jenkins:~$ sudo systemctl status postgresql`

`anup@ubuntu-2210-55-jenkins:~$ sudo systemctl enable postgresql`

`anup@ubuntu-2210-55-jenkins:~$ sudo passwd postgres`

    2*hIskE3aLnh

`postgres@ubuntu-2210-55-jenkins:~$ createuser sonar`

`anup@ubuntu-2210-55-jenkins:~$ su - postgres`

    postgres=# ALTER USER sonar WITH ENCRYPTED password '2*hIskE3aLnh';
    postgres=# CREATE DATABASE sonarqube OWNER sonar;
    postgres=# \l
    postgres=# \q

`postgres@ubuntu-2210-55-jenkins:~$ exit`
