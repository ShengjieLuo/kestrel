#----------Configuration-----------
export KUBEROOT=~/kubernetes
export K8S_GO_HOME=$KUBEROOT/go


#--------- Install Go--------------
mkdir $KUBEROOT
echo "++++++++++++++ Install GO ++++++++++++++++"
mkdir $K8S_GO_HOME
cd $K8S_GO_HOME
wget https://dl.google.com/go/go1.11.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.11.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
cd -

#--------- Install Docker ----------
echo "++++++++++++++ Install Docker ++++++++++++++++"
sudo apt-get remove docker docker-engine docker.io
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce
sudo docker run hello-world


#--------- Install K8S ----------
echo "++++++++++++++ Install K8S ++++++++++++++++"
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo kubeadm join 10.128.0.4:6443 --token u8zrsr.330qvmfqfsnmput6 --discovery-token-ca-cert-hash sha256:11c8f3b0102e1337a1381a423a5698e24118c6ed50cd0b67d1c8e61f3555f72b --ignore-preflight-errors=all
