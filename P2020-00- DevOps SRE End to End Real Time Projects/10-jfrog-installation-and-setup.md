#### Installation and setup,

JFrog Artifactory: https://www.jfrog.com/confluence/display/JFROG/Installing+Artifactory

Artifactory OSS : https://jfrog.com/open-source/?_gl=1*d6oq6c*_ga*NjM2ODk4MDI0LjE2Njc5MjEzMDI.*_ga_SQ1NR9VTFJ*MTY2NzkyMTMwMi4xLjAuMTY2NzkyMTMwMi42MC4wLjA.

Choose : https://jfrog.com/community/download-artifactory-oss/

<br>

`anup@ubuntu-2210-55-jenkins:~$ sudo dpkg -i jfrog-artifactory-oss-7.46.11.deb `

`anup@ubuntu-2210-55-jenkins:~$ sudo systemctl start artifactory.service`

`anup@ubuntu-2210-55-jenkins:~$ sudo systemctl status artifactory.service`

`anup@ubuntu-2210-55-jenkins:~$ sudo systemctl enable artifactory.service`

http://192.168.56.55:8082/ui

<br>

https://www.jfrog.com/confluence/display/JFROG/Installing+Artifactory#InstallingArtifactory-Post-InstallationSteps

Change the default admin password . The default user will have the following credentials predefined in the system:
User: admin, Password: password

#### Changed to,

ID : admin

Password : 2*hIskE3aLnh

<br>
