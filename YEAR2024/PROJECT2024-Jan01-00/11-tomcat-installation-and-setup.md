`anup@ubuntu-2210-55-jenkins:~/tomcat-9/webapps/manager/META-INF$ nano context.xml`

`anup@ubuntu-2210-55-jenkins:~/tomcat-9/webapps/host-manager/META-INF$ nano context.xml`

`anup@ubuntu-2210-55-jenkins:~/tomcat-9/conf$ nano tomcat-users.xml`

Add these to configuration,

    <role rolename="manager-gui"/>
    <role rolename="admin-gui"/>
    <role rolename="manager-script"/>
    <role rolename="manager-jmx"/>
    <role rolename="manager-status"/>
    <user username="anuniqs" password="2*hIskE3aLnh" roles="manager-gui,admin-gui,manager-script,manager-script,manager-stat>


`anup@ubuntu-2210-55-jenkins:~/tomcat-9/conf$ nano server.xml`

Tomcat : http://192.168.56.55:9090/

<br>
