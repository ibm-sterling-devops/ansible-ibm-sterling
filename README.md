# ansible-ibm-sterling
Ansible collection supporting devops for IBM Sterling B2Bi, IBM Connect:Direct, Seas, ...


# Playbooks

| Playbook name                 | Status         |           Description                                        |
|-------------------------------|----------------|--------------------------------------------------------------|
| setup-cd.yml                  | Complete       | Install IBM Connect:Direct 6.2.x |
| setup-sb2b.yml                | Complete       | Install IBM Sterling B2B Integrator 6.1.2  - one node only |
| setup-db2.yml                 | Complete       | Install IBM DB2 11.5.x and setup Sterling B2Bi Database |
| setup-nginx.yml               | Complete       | Install Nginx as HTTP server for Repository|            

# Roles

| Role name                       |            Description of Role                                          |
|---------------------------------|-------------------------------------------------------------------------|
| ibm/cd-unix/cd-install          | Install IBM Connect:Direct |
| ibm/cd-unix/cd-start            | Start Connect:Direct |
| ibm/cd-unix/cd-stop             | Stop Connect:Direct |
| ibm/db2/create-sb2b-db          | setup Sterling B2Bi Database |
| ibm/db2/db2-install             | Install IBM DB2 |
| ibm/db2/db2-restart             | Stop and Start IBM DB2 |
| ibm/db2/db2-start               | Start IBM DB2 |
| ibm/db2/db2-stop                | Stop IBM DB2 |
| ibm/sb2b/sb2b-api-setup         | Config B2B REST API |
| ibm/sb2b/sb2b-server-install    | Install IBM Sterling B2B |
| ibm/sb2b/sb2b-start             | Start SB2Bi |
| ibm/sb2b/sb2b-stop              | Stop SB2Bi |
| others/nginx-install            | Install Nginx |


# Getting start

## Prerequisites

1) Download installation files:

| Product Name                  | PartNum | Filename                        |           Description                                        |
|-------------------------------|---------|---------------------------------|--------------------------------------------------------------|
| IBM Connect:Direct            |         | IBM_CD_V6.2_UNIX_RedHat.Z.tar.Z |  IBM Connect:Direct 6.2.x|
| IBM DB2 V11.5.x               |         | DB2S_11.5.4_MPML.tar.gz         | IBM DB2 V11.5.4 Multi-platform Multi-language|
| IBM Java SDK/JRE              | M06M9ML | SB2BI_6.1.2_MP_ML_JDK.zip       | IBM Sterling B2B Integrator V6.1.2 or IBM Sterling File Gateway V6.1.2 Java SDK/JRE Multiplatform|
| IBM Sterling B2B Integrator   | M06MCML | SB2BI_6.1.2_MP_ML.zip           | IBM Sterling B2B Integrator V6.1.2 for Multiplatform Multilingual|
| IBM Java Unrestricted Policy  |         | unrestrictedpolicyfiles.zip     |               |

2) Copy files to Web Server

Example of my repository: /usr/share/nginx/html


## Cloning ansible-ibm-websphere from git

```
git clone https://github.com/ibm-sterling-devops/ansible-ibm-sterling.git
```

## Running playbooks

Install Connect:Direct

```
cd ansible-ibm-sterling

ansible-playbook -i environments/hosts.dev -u root playbooks/setup-cd.yml
```

Install Sterling B2B

```
cd ansible-ibm-sterling

ansible-playbook -i environments/hosts.dev -u root playbooks/setup-sb2b.yml
```

# Contributors

See the list of [contributors](https://github.com/ibm-sterling-devops/ansible-ibm-sterling/contributors) who participated in this project.

# License

This project is licensed under the Eclipse Public License - v 2.0 - see the [LICENSE.md](LICENSE.md) file for details

## Disclaimer

This product is not officially supported, and can be used as is. And any feedback will be welcome. We does not make any warranty about the completeness, reliability and accuracy of this code. Any action you take by using this code is strictly at your own risk, and this project will not be liable for any losses and damages in connection with the use of this code.
