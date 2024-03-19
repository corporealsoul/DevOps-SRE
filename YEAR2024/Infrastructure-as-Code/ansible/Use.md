### Communication
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00$ ansible all -m ping
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00$ ansible localhost -m ping
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00$ ansible-inventory --list

### Run a Playbook
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00/ansible$ ansible-playbook -i ./contrib/hosts ./playbooks/gather_facts.yml

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00/ansible$ ansible-playbook -i ./contrib/hosts ./playbooks/docker.yml --become --ask-become-pass
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00/ansible$ ansible-playbook -i ./contrib/hosts ./playbooks/docker.yml --become --ask-become-pass -l <server_hostname>

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ ansible-playbook -i ./contrib/hosts ./playbooks/jenkins.yml --become --ask-become-pass --syntax-check
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ ansible-playbook -i ./contrib/hosts ./playbooks/jenkins.yml --become --ask-become-pass --check
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ ansible-playbook -i ./contrib/hosts ./playbooks/jenkins.yml --become --ask-become-pass
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ sudo systemctl status jenkins.service 

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ ansible-playbook -i ./contrib/hosts ./playbooks/java.yml --become --ask-become-pass --syntax-check

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ ansible-playbook -i ./contrib/hosts ./playbooks/maven.yml --become --ask-become-pass --syntax-check

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ ansible-playbook -i ./contrib/hosts ./playbooks/kubeadm.yml --become --ask-become-pass -l 192.168.56.104 -vv


anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ ls -ltr