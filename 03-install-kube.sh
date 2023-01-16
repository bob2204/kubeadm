#!/bin/bash

# Kubeadm, kubelet, kubeclt

apt-get update && apt-get install -y apt-transport-https curl gnupg
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubeadm

mkdir -p /etc/bash_completion.d
kubectl completion bash >/etc/bash_completion.d/kubectl
echo 'alias k=kubectl' >> /etc/bash.bashrc
echo 'complete -o default -F __start_kubectl k' >> /etc/bash.bashrc
