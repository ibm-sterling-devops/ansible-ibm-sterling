Installation Guide for kubectl, oc, git, helm and ansible on Ubuntu/Debian
===============================================================================

### Install Packages

1. Update and install packages

```sh
sudo apt -y update
sudo apt -y upgrade
```

2. Install packages

```sh
sudo apt -y install ansible git openjdk-17-jre-headless python3-pip python3-kubernetes python3-requests python3-yaml
```

3. Install kubectl and oc

```sh
curl -LO "https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz"

tar -xzvf openshift-client-linux.tar.gz

chmod +x oc 
chmod +x kubectl

sudo mv oc kubectl /usr/local/bin/
```
4. Install ansible kubernetes.core 

```sh
ansible-galaxy collection install kubernetes.core
```


### Install git, ansible, helm

1. Add the Helm dependencies:

```sh
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

sudo apt update
sudo apt install helm
```

### Verify

1. Verify the installation:
```sh
git --version
```

2. Verify the installation:
```sh
oc version
```

3. Verify the installation:
```sh
kubectl version
```

4. Verify the installation:
```sh
ansible --version
```

5. Verify the installation:
```sh
helm --version
```

6. Verify the installation:
```sh
keytool
```