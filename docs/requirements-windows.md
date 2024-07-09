Installation Guide for kubectl, oc, git, helm and ansible on MS Windows using WSL
===============================================================================

### Install WSL
1. Open PowerShell as Administrator and run:
```sh
wsl --install
```

2. Restart your computer if prompted.

3. Install a Linux distribution from the Microsoft Store (e.g., Ubuntu).

### Set up WSL

1. Open your installed Linux distribution.

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

### Install git, ansible, helm


1. Add the Helm dependencies:

```sh
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
```

2. Add the Ansible PPA dependencies:
```sh
sudo apt -y install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
```

3. Install packages
```sh
sudo apt -y update
sudo apt -y install git ansible helm
```

4. Verify the installation:
```sh
git --version
```

5. Verify the installation:
```sh
ansible --version
```

6. Verify the installation:
```sh
helm --version
```
