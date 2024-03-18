### Step 1: Update and Upgrade Ubuntu (all nodes)
anup@blueprintsandco:~$ sudo apt update
anup@blueprintsandco:~$ sudo apt upgrade


### Step 2: Disable Swap (all nodes)
anup@blueprintsandco:~$ sudo swapoff -a
anup@blueprintsandco:~$ sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
anup@blueprintsandco:~$ sudo nano /etc/fstab


### Step 3: Add Kernel Parameters (all nodes)
Load the required kernel modules on all nodes:
anup@blueprintsandco:~$ sudo tee /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF
anup@blueprintsandco:~$ sudo modprobe overlay
anup@blueprintsandco:~$ sudo modprobe br_netfilter

Configure the critical kernel parameters for Kubernetes using the following:
anup@blueprintsandco:~$ sudo tee /etc/sysctl.d/kubernetes.conf <<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

Then, reload the changes:
anup@blueprintsandco:~$ sudo sysctl --system


### Step 4: Install Containerd Runtime (all nodes)

Dependencies:
anup@blueprintsandco:~$ sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates

Enable the Docker repository:
anup@blueprintsandco:~$ sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/docker.gpg
anup@blueprintsandco:~$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

Update the package list and install containerd:
anup@blueprintsandco:~$ sudo apt update
anup@blueprintsandco:~$ sudo apt install -y containerd.io

Configure containerd to start using systemd as cgroup:
anup@blueprintsandco:~$ containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1
anup@blueprintsandco:~$ sudo sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml

Restart and enable the containerd service:
anup@blueprintsandco:~$ sudo systemctl restart containerd
anup@blueprintsandco:~$ sudo systemctl enable containerd
anup@blueprintsandco:~$ sudo systemctl status containerd


### Step 5: Add Apt Repository for Kubernetes (all nodes)
anup@blueprintsandco:~$ curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
anup@blueprintsandco:~$ echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list


### Step 6: Install Kubectl, Kubeadm, and Kubelet (all nodes)
anup@blueprintsandco:~$ sudo apt update
anup@blueprintsandco:~$ sudo apt install -y kubelet kubeadm kubectl
anup@blueprintsandco:~$ sudo apt-mark hold kubelet kubeadm kubectl


HAVE DOCKER


anup@blueprintsandco:~$ systemctl status kubelet
anup@blueprintsandco:~$ systemctl status kubeadm
anup@blueprintsandco:~$ systemctl status kubectl


### Step 7: Initialize Kubernetes Cluster with Kubeadm (master node)

anup@blueprintsandco:~$ sudo kubeadm init
anup@blueprintsandco:~$ sudo kubeadm init --pod-network-cidr=192.168.0.0/16

anup@blueprintsandco:~$ mkdir -p $HOME/.kube
anup@blueprintsandco:~$ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
anup@blueprintsandco:~$ sudo chown $(id -u):$(id -g) $HOME/.kube/config


### Step :9 Install Kubernetes Network Plugin (master node)
https://docs.tigera.io/calico/3.25/getting-started/kubernetes/quickstart
anup@blueprintsandco:~$ kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.2/manifests/tigera-operator.yaml
anup@blueprintsandco:~$ kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.2/manifests/custom-resources.yaml
anup@blueprintsandco:~$ kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.2/manifests/calico.yaml

anup@blueprintsandco:~$ kubectl cluster-info
anup@blueprintsandco:~$ kubectl get nodes
anup@blueprintsandco:~$ kubectl describe node blueprintsandco

anup@blueprintsandco:~$ sudo kubeadm reset


### Step 8: Add Worker Nodes to the Cluster (worker nodes)
kubeadm join 192.168.56.104:6443 --token 64pr6l.5htg9vpgeq29b4ak \
        --discovery-token-ca-cert-hash sha256:d6c88e72e3e6ad71d39f40e675d0877a5cdf4d04fa2e0fc09be656314c3e8788


### Step 10: Verify the cluster and test (master node)
anup@blueprintsandco:~$ kubectl get pods -n kube-system
anup@blueprintsandco:~$ kubectl get nodes
anup@blueprintsandco:~$ kubectl get nodes -o wide


### Troubleshoot :
anup@blueprintsandco:~$ systemctl status kubelet
anup@blueprintsandco:~$ kubectl -n kube-system logs kubelet-redprintsandco


anup@blueprintsandco:~$ kubectl delete -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml
