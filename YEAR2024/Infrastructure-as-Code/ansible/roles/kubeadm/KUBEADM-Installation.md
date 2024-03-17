https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#installing-kubeadm-kubelet-and-kubectl


### Verify the MAC address and product_uuid are unique for every node 
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$ ifconfig -a
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$ sudo cat /sys/class/dmi/id/product_uuid

### Check required ports 
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$ nc 127.0.0.1 6443 -v


### Installing a container runtime
Docker

### Update the apt package index and install . . . . 
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$ sudo apt-get update
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$ sudo apt-get install -y apt-transport-https ca-certificates curl gpg

### Download the public signing key for the . . . .
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ ls -ltr /etc/apt/keyrings/
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$ curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

### Add the appropriate Kubernetes apt repository . . . .
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$ echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

### Update the apt package index, install kubelet, kubeadm and kubectl, and pin their version . . . .
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$ sudo apt-get update
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$ sudo apt-get install -y kubelet kubeadm kubectl
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$ sudo apt-mark hold kubelet kubeadm kubectl

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ kubelet --version
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ kubeadm version
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible$ kubectl version

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$ sudo systemctl enable --now kubelet
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$ sudo systemctl start kubelet.service
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$ sudo systemctl status kubelet.service

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$ cat /etc/containerd/config.toml
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$ sudo journalctl -u kubelet


