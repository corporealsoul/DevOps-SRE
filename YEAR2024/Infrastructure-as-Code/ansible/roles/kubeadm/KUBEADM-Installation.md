### Step 1: Update and Upgrade Ubuntu (all nodes)
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo apt update
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo apt upgrade


### Step 2: Disable Swap (all nodes)
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo swapoff -a
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo nano /etc/fstab


### Step 3: Add Kernel Parameters (all nodes)
Load the required kernel modules on all nodes:
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo tee /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo modprobe overlay
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo modprobe br_netfilter

Configure the critical kernel parameters for Kubernetes using the following:
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo tee /etc/sysctl.d/kubernetes.conf <<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

Then, reload the changes:
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo sysctl --system


### Step 4: Install Containerd Runtime (all nodes)

Dependencies:
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates

Enable the Docker repository:
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/docker.gpg
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

Update the package list and install containerd:
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo apt update
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo apt install -y containerd.io

Configure containerd to start using systemd as cgroup:
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml

Restart and enable the containerd service:
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo systemctl restart containerd
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo systemctl enable containerd
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo systemctl status containerd


### Step 5: Add Apt Repository for Kubernetes (all nodes)
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list


### Step 6: Install Kubectl, Kubeadm, and Kubelet (all nodes)
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo apt update
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo apt install -y kubelet kubeadm kubectl
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo apt-mark hold kubelet kubeadm kubectl


Have DOCKER Installed


anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  systemctl status kubelet
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  systemctl status kubeadm
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  systemctl status kubectl

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  kubelet --version
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  kubeadm version
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  kubectl version
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  kubectl version --output=yaml


### Step 7: Initialize Kubernetes Cluster with Kubeadm (master node)
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --control-plane-endpoint=192.168.56.104
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --control-plane-endpoint=192.168.56.104

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  mkdir -p $HOME/.kube
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo chown $(id -u):$(id -g) $HOME/.kube/config

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  kubectl cluster-info
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  kubectl get nodes -o wide
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  kubectl get pods -A
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  kubectl get pods -n kube-system
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  kubectl get pods --all-namespaces
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  kubectl get componentstatuses -n kube-system
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  kubectl describe node blueprintsandco


### Step 8: Add Worker Nodes to the Cluster (worker nodes)

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  kubeadm token create --print-join-command
sudo kubeadm join 10.0.2.15:6443 --token yokrmr.qo2fn1aa1ee3jml8 --discovery-token-ca-cert-hash sha256:f949d66ad1febba2e90bbf6c4c5d6d52bb9b761114b566eaf7117b7f99c12417


### Step :9 Install Kubernetes Network Plugin (master node)
https://docs.tigera.io/calico/latest/getting-started/kubernetes/self-managed-onprem/onpremises
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.2/manifests/tigera-operator.yaml
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  curl https://raw.githubusercontent.com/projectcalico/calico/v3.27.2/manifests/calico.yaml -O
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  kubectl apply -f calico.yaml
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  watch kubectl get pods -n calico-system

https://github.com/flannel-io/flannel/tree/master
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  watch kubectl get pods -n kube-flannel


### Step 10: Verify the cluster and test (master node)
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  kubectl get pods -n kube-system
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  kubectl get nodes
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  kubectl get nodes -o wide


### Troubleshoot :
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo systemctl status kubelet
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  kubectl -n kube-system logs kubelet-redprintsandco

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo kubeadm reset

anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo rm /etc/kubernetes/kubelet.conf
anup@blueprintsandco:~/DevOps-SRE/YEAR2024/Infrastructure-as-Code/ansible/roles/kubeadm$  sudo rm /etc/kubernetes/pki/ca.crt
