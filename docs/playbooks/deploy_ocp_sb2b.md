# Deploy IBM Sterling B2B Integrator on OpenShift using Ansible Scripts

Playbook will run the last version of Sterling B2Bi, but take care of Kubernetes/Openshift version is supported

| Sterling B2Bi             | OpenShift           | Kubernetes          | helm-chart |
|---------------------------|---------------------|---------------------|------------|
| 6.2.1.0                   | >= 4.14             | >= 1.28 and <= 1.31 | 3.1.0      |
| 6.2.0.4                   | >= 4.14             | >= 1.27             | 3.0.6      |
| 6.2.0.3                   | >= 4.14             | >= 1.27             | 3.0.5      |
| 6.2.0.2                   | >= 4.14 and <= 4.15 | >= 1.27 and <= 1.29 | 3.0.4      |
| 6.2.0.1                   | >= 4.13 and <= 4.14 | >= 1.26 and <= 1.28 | 3.0.1      |


## Preparation

### 1. IBM Entitled Registry

You must have **kubectl**, **oc**, **git** and **ansible** installed in your machine

Log in the [IBM Container software library](https://myibm.ibm.com/products-services/containerlibrary) with the IBMid and password that are associated with the entitled software. Click **Get entitlement key**. With key export variable

```bash 
export ENTITLED_REGISTRY_KEY=<entitlement_key>
```

### 2. Login on OpenShift

Do a login in Openshift console and run the command:

```bash 
oc login --token=sha256~P...k --server=https://c....containers.cloud.xxx.com:31234
```

### 3. Cloning ansible-ibm-sterling from git

```bash 
git clone https://github.com/ibm-sterling-devops/ansible-ibm-sterling.git
```

### 4. Set roles path

To run playbook the playbook

```bash 
cd ansible-ibm-sterling

export ANSIBLE_CONFIG=./ansible.cfg 
```

## Deploying Sterling B2B Integrator

1) First you need to provide SI_INSTANCEID, this is used to define your environment. Samples: dev01, dev02, poc01, qa01, prod01

```bash 
export SI_INSTANCEID=dev01
```

2) To run playbook the playbook

```bash 
ansible-playbook playbooks/deploy_sb2b.yml
```

## Deploying Sterling B2B Integrator - older version

1) First you need to provide SI_INSTANCEID, this is used to define your environment. Samples: dev01, dev02, poc01, qa01, prod01

```bash 
export SI_INSTANCEID=dev01
```

2) (Optional) change your version: 

We always run the last version of Sterling B2Bi, but you can choose to run a different version, based on your RH OpenShift version.

```bash 
export SI_VERSION=6.2.0.4
```

3) To run playbook the playbook


```bash 
ansible-playbook playbooks/deploy_sb2b.yml
```


## Deploy Sterling B2Bi using prebuilt db.

If your using SB2Bi for a prove of concept and get the environment provided in 10 minutes, i suggest to deploy using prebuilt db.

!!! tip
    You need to have a backup from a previous install, we cannot provide because of copyright


1) Define previous environment variables

```bash 
export SI_INSTANCEID=dev01
```

2) Provide your Sterling B2BI database backup

```bash 
export SI_PREBUILTDB_FILE=/tmp/B2BI_6202.tar.gz
```

3) disable database setup and upgrade

```bash 
export SI_DATASETUP_ENABLED=false
export SI_DATASETUP_UPGRADE=false
```

4) Run prebuilt playbook

```bash 
ansible-playbook playbooks/deploy_sb2b_prebuiltdb.yml
```

## Environment Variable

Environment variables for this role:

| Environment Variable         | Default Value     | Required | Description
|------------------------------|-------------------| ---------|-------------------------------------|
| ENTITLED_REGISTRY_KEY        |                   | Yes      | IBM Entitled Registry key |
| SI_INSTANCEID                |                   | Yes      | Used to define your environment |
| SI_ACTION                    | install           | No       | Action: install, upgrade, prebuiltdb           | 
| SI_LICENSETYPE               | no-prod           | No       | Specify the license edition as per license agreement. Valid value is **prod** or **non-prod** for Production and Non-production respectively. Remember that this parameter is crucial for IBM Licensing and Metering Service | 
| SI_SYSTEM_PASSPHRASE         | passw0rd          | No       | Name of system passphrase secret if available |
| SI_ADMIN_MAILADDR            | admin@company.com | No       | Provide the admin email address |
| SI_ADMIN_SMTPHOST            | smtp.company.com  | No       | Provide the SMTP host details |
| SI_DBVENDOR                  | DB2               | No       | Database vendor: DB2, Oracle, MSSQL           | 
| SI_DBHOST                    | <from service>    | No       | Database hostname/ip address |
| SI_DBPORT                    | <from service>    | No       | Database port |
| SI_DBNAME                    | B2BI              | No       | Database name |
| SI_DBUSER                    | db2inst1          | No       | Database user |
| SI_DBPASSWORD                | passw0rd          | No       | Database user password |
| SI_ORACLESERVICENAME         | false             | No       | Oracle service name, must be **true** when database is Oracle |
| SI_DATASETUP_ENABLED         | true              | No       | Enable database setup job execution |
| SI_DATASETUP_UPGRADE         | false             | No       | Upgrade an older release |
| SI_JMS_USERNAME              |                   | No       | JMS Queue user |
| SI_JMS_PASSWORD              | passw0rd          | No       | JMS Queue user password |
| SI_JMS_KEYSTORE_PASSWORD     |                   | No       | JMS Queue keystore password |
| SI_JMS_TRUSTSTORE_PASSWORD   |                   | No       | JMS Queue truststore password |
| SI_LIBERTY_KEYSTORE_PASSWORD | changeit          | No       | Liberty keystore password |
| SI_SKIP_HELM                 | false             | No       | Avoid to run helm, only generate values.yaml  |

For all environment variables

* Role [sb2bi_setup_db2](../../roles/sb2bi_setup_db2)
* Role [sb2bi_deploy_db2](../../roles/sb2bi_deploy_db2)
* Role [sb2bi_deploy_mq](../../roles/sb2bi_deploy_mq)

* Role [sb2bi_prebuiltdb_db2](../../roles/sb2bi_prebuiltdb_db2)