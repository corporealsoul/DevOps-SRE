## CentOS
### Installing Ansible, YUM/DNF installation, 
https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html

[anup@blueprintsandco PROJECT2024-Mar12-00]$ sudo dnf install ansible
[anup@blueprintsandco PROJECT2024-Mar12-00]$ ansible --version

### Ping all
[anup@blueprintsandco ansible]$ ansible all -m ping
[anup@blueprintsandco ansible]$ ansible localhost -m ping
[anup@blueprintsandco ansible]$ ansible-inventory --list

### Run an ansible playbook
[anup@blueprintsandco ansible]$ ansible-playbook -i ./contrib/hosts ./playbooks/gather_facts.yml



## UBUNTU
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00$ sudo apt install ansible
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00$ ansible --version

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00$ ansible all -m ping
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00$ ansible localhost -m ping
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00$ ansible-inventory --list

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00/ansible$ ansible-playbook -i ./contrib/hosts ./playbooks/gather_facts.yml

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00/ansible$ ansible-playbook -i ./contrib/hosts ./playbooks/docker_setup.yml 







