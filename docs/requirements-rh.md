Installation Guide for kubectl, oc, git, helm and ansible on Redhat Linux/Fedora/CentOS
===============================================================================

### Install kubectl and oc
1. Download the latest release:
```sh
curl -LO "https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz"
```

2. Extract the tar file:
```sh
tar -xzvf openshift-client-linux.tar.gz
```

3. Move the binaries to your PATH:
```sh
chmod +x oc 
chmod +x kubectl

sudo mv oc kubectl /usr/local/bin/
```

4. Test to ensure the version you installed is up-to-date:
```sh
oc version
```

### Install helm

1. Download the latest release:
```sh
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
$ chmod 700 get_helm.sh
$ ./get_helm.sh
```

2. Verify the installation:
```sh
helm --version
```

### Install git, ansible, , python3-pip, java (keytool)
1. Install the dependencies:
```sh
sudo yum -y install epel-release
sudo yum -y update
sudo yum -y install git ansible python3-pip java-17-openjdk-headless

pip3.11 install kubernetes requests
```


2. Install kubernetes.core module
```sh
ansible-galaxy collection install kubernetes.core
```

3. Verify the installation:
```sh
ansible --version
```

4. Verify the installation:
```sh
helm --version
```
