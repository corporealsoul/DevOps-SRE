https://docs.docker.com/engine/install/ubuntu/

### Uninstall old versions
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

### Install using the apt repository
# Add Docker's official GPG key:
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ sudo apt-get update
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ sudo apt-get install ca-certificates curl
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ sudo install -m 0755 -d /etc/apt/keyrings
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ sudo apt-get update

### Docker CE
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

### post-installation steps
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ sudo groupadd docker
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ sudo usermod -aG docker $USER
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ newgrp docker
