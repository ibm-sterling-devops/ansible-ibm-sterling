# Getting start

## Prerequisites

### Download installation files:

| Product Name                  | PartNum | Filename                        |           Description       |
|-------------------------------|---------|---------------------------------|-----------------------------|
| IBM Connect:Direct            |         | IBM_CD_V6.2_UNIX_RedHat.Z.tar.Z | IBM Connect:Direct 6.2.x|

### Install Nginx


First, ensure your system is up-to-date with the latest packages. Nginx is not available in the default repositories of Red Hat-based systems. You need to install the EPEL (Extra Packages for Enterprise Linux) repository.

```bash
sudo yum update -y

sudo yum install epel-release -y
```

Now you can install Nginx using the following command:

```bash
sudo yum install nginx -y
```

After installing Nginx, start the Nginx service and ensure that Nginx starts automatically at boot time, with the following command:

```bash
sudo systemctl start nginx
sudo systemctl enable nginx
```

3) Copy download files to Web Server

```bash
 cp IBM_CD_V6.2_UNIX_RedHat.Z.tar.Z /usr/share/nginx/html
```

### Cloning ansible-ibm-websphere from git

```bash 
git clone https://github.com/ibm-sterling-devops/ansible-ibm-sterling.git
```

### Create a inventory file 

Copy from template

```bash 
cd ansible-ibm-sterling

cp environments/cd-servers.dev.sample environments/hosts.dev

```
Edit and provide information for your environment, like C:D node name and ip address.

Provide information for you nginx server

### Running playbooks

Install Connect:Direct (standalone)

```bash 
cd ansible-ibm-sterling

ansible-playbook -i environments/hosts.dev -u root playbooks/setup-cd.yml
```
