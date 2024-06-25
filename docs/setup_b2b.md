# Getting start

## Prerequisites

### Download installation files:

| Product Name                  | PartNum | Filename                        |           Description                                        |
|-------------------------------|---------|---------------------------------|---------------------------------|

| IBM DB2 V11.5.x               |         | DB2S_11.5.4_MPML.tar.gz         | IBM DB2 V11.5.4 Multi-platform Multi-language|
| IBM Java SDK/JRE              | M06M9ML | SB2BI_6.1.2_MP_ML_JDK.zip       | IBM Sterling B2B Integrator V6.1.2 or IBM Sterling File Gateway V6.1.2 Java SDK/JRE Multiplatform|
| IBM Sterling B2B Integrator   | M06MCML | SB2BI_6.1.2_MP_ML.zip           | IBM Sterling B2B Integrator V6.1.2 for Multiplatform Multilingual|
| IBM Java Unrestricted Policy  |         | unrestrictedpolicyfiles.zip     |               |

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
 cp <files> /usr/share/nginx/html
```

### Cloning ansible-ibm-websphere from git

```bash 
git clone https://github.com/ibm-sterling-devops/ansible-ibm-sterling.git
```

### Create a inventory file 

Copy from template

```bash 
cd ansible-ibm-sterling

cp environments/sb2b-servers.dev.sample environments/hosts.dev

```
Edit and provide information for your environment, like DB2 server, Sterling Integrator node name, ...

Provide information for you nginx server

### Running playbooks

Install Sterling B2B (standalone)

```bash 
cd ansible-ibm-sterling

ansible-playbook -i environments/hosts.dev -u root playbooks/setup-sb2b.yml
```
