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

### Install git, ansible, helm, python3-pip, java (keytool)
1. Install the dependencies:
```sh
sudo yum -y install epel-release
sudo yum -y update
sudo yum -y install git ansible helm python3-pip java-17-openjdk-headless

pip3 install kubernetes
```

2. Verify the installation:
```sh
git --version
```

3. Verify the installation:
```sh
ansible --version
```

4. Verify the installation:
```sh
helm --version
```
