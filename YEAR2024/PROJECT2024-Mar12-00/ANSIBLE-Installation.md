https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00$ sudo apt update
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00$ sudo apt install software-properties-common
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00$ sudo add-apt-repository --yes --update ppa:ansible/ansible
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00$ sudo apt install ansible
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00$ ansible --version

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00$ ansible all -m ping
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00$ ansible localhost -m ping
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00$ ansible-inventory --list

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00/ansible$ ansible-playbook -i ./contrib/hosts ./playbooks/gather_facts.yml
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00/ansible$ ansible-playbook -i ./contrib/hosts ./playbooks/docker_setup.yml --become --ask-become-pass
