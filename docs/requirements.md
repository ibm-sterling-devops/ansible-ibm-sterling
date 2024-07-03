Sure, here's the updated guide for installing `kubectl`, `oc`, `git`, and `ansible` on Linux using `yum`:

Installation Guide for kubectl, oc, git, and ansible
===============================================================================

# Linux

### Install kubectl
1. Download the latest release:

```sh
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

2. Make the kubectl binary executable:
```bash
chmod +x ./kubectl
```

3. Move the binary to your PATH:
```
sudo mv ./kubectl /usr/local/bin/kubectl
```

4. Test to ensure the version you installed is up-to-date:
```sh
kubectl version --client
```

### Install oc
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
sudo mv oc kubectl /usr/local/bin/
```

4. Test to ensure the version you installed is up-to-date:
```sh
oc version
```

### Install git
1. Install git:
```sh
sudo yum update -y
sudo yum install git -y
```

2. Verify the installation:
```sh
git --version
```

### Install ansible
1. Install the dependencies:
```sh
sudo yum install epel-release -y
sudo yum update -y
```

2. Install Ansible:
```sh
sudo yum install ansible -y
```

3. Verify the installation:
```sh
ansible --version
```

# macOS

### Install kubectl
1. Install with Homebrew:
```sh
brew install kubectl
```

2. Test to ensure the version you installed is up-to-date:
```sh
kubectl version --client
```

### Install oc
1. Install with Homebrew:
```sh
brew install openshift-cli
```

2. Test to ensure the version you installed is up-to-date:
```sh
oc version
```

### Install git
1. Verify the installation:
```sh
git --version
```

### Install ansible
1. Install Ansible with Homebrew:
```sh
brew install ansible
```

2. Verify the installation:
```sh
ansible --version
```

## Windows (Using WSL)

### Install WSL
1. Open PowerShell as Administrator and run:
```sh
wsl --install
```

2. Restart your computer if prompted.

3. Install a Linux distribution from the Microsoft Store (e.g., Ubuntu).

### Set up WSL
1. Open your installed Linux distribution.

2. Update the package list and install necessary packages:
```sh
sudo apt-get update
sudo apt-get upgrade -y
```

### Install kubectl
1. Download the latest release:
```sh
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

2. Make the kubectl binary executable:
```sh
chmod +x ./kubectl
```

3. Move the binary to your PATH:
```sh
sudo mv ./kubectl /usr/local/bin/kubectl
```

4. Test to ensure the version you installed is up-to-date:
```sh
kubectl version --client
```

### Install oc
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
sudo mv oc kubectl /usr/local/bin/
```

4. Test to ensure the version you installed is up-to-date:
```sh
oc version
```

### Install git
1. Install git:
```sh
sudo apt-get update
sudo apt-get install git -y
```

2. Verify the installation:
```sh
git --version
```

### Install ansible
1. Install the dependencies:
```sh
sudo apt-get update
sudo apt-get install software-properties-common -y
```

2. Add the Ansible PPA:
```sh
sudo add-apt-repository --yes --update ppa:ansible/ansible
```

3. Install Ansible:
```sh
sudo apt-get install ansible -y
```

4. Verify the installation:
```sh
ansible --version
```

This guide now includes instructions for using `yum` to install `kubectl`, `oc`, `git`, and `ansible` on Linux.