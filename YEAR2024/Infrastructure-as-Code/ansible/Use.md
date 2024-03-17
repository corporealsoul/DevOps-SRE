### Communication
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00$ ansible all -m ping
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00$ ansible localhost -m ping
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00$ ansible-inventory --list

### Run a Playbook
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00/ansible$ ansible-playbook -i ./contrib/hosts ./playbooks/gather_facts.yml
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/PROJECT2024-Mar12-00/ansible$ ansible-playbook -i ./contrib/hosts ./playbooks/docker_setup.yml --become --ask-become-pass