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

### Install git, ansible, , python3-pip, java (keytool)
1. Install the dependencies:
```sh
sudo dnf install -y python3.13 python3.13-pip helm java-21-openjdk git
```

2. Change default python in 
```sh
sudo alternatives --install /usr/bin/python3 python3 /usr/bin/python3.13 1
sudo alternatives --set python3 /usr/bin/python3.13
```

3. Install the ansible:
```sh
sudo dnf install -y ansible-core
```

3. Install Python Libraries
```sh
pip3.13 install kubernetes requests ansible-core
```

4. Install kubernetes.core module
```sh
ansible-galaxy collection install kubernetes.core
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

6. Verify the installation:
```sh
keytool
```