# Deploy IBM Sterling B2B Integrator on OpenShift using Ansible Scripts

## Supported versions

Playbook will run the last version of Sterling B2Bi, but take care of Kubernetes/Openshift version is supported

| Sterling B2Bi (helm) | Kubernetes          | OpenShift           | Helm      |
|----------------------|---------------------|---------------------|-----------|
| 6.2.0.2 (3.0.4)      | >= 1.27 and <= 1.29 | >= 4.14 and <= 4.15 | >= 3.14.x |
| 6.2.0.1 (3.0.1)      | >= 1.26 and <= 1.28 | >= 4.13 and <= 4.14 | >= 3.13.x |
| 6.2.0.0 (3.0.0)      | >= 1.25 and <= 1.27 | >= 4.12 and <= 4.13 | >= 3.12.x |

Check with

```bash 
kubectl version
```

# Deploying Sterling B2B Integrator

## IBM Entitled Registry

You must have **kubectl**, **oc**, **git** and **ansible** installed in your machine

Log in the [IBM Container software library](https://myibm.ibm.com/products-services/containerlibrary) with the IBMid and password that are associated with the entitled software. Click **Get entitlement key**. With key export variable

```bash 
export ENTITLED_REGISTRY_KEY=<entitlement_key>
```

## Login on OpenShift

Do a login in Openshift console and run the command:

```bash 
oc login --token=sha256~P...k --server=https://c....containers.cloud.xxx.com:31234
```

## Cloning ansible-ibm-websphere from git

```bash 
git clone https://github.com/ibm-sterling-devops/ansible-ibm-sterling.git
```

Change directory

```bash 
cd ansible-ibm-sterling
```

## Run playbook the playbook

1) First you need to provide SI_INSTANCEID, this is used to define your environment. Samples: dev01, dev02, poc01, qa01, prod01

```bash 
export SI_INSTANCEID=dev01
```

2) Provide de url domain SI_DOMAIN

```bash 
export SI_DOMAIN=ocp01-8...74-0000.us-south.containers.appdomain.cloud
```

You can get this information from your OpenShift console url:

| Environment  | Sample URL      |
|--------------|-------------------------------------------------------|
| IBM Cloud    | ocp01-8...74-0000.us-south.containers.appdomain.cloud |
| IBM Techzone | apps.34...6e.cloud.techzone.ibm.com |

3) (Optional) change your version: 

We always run the last version of Sterling B2Bi, but you can choose to run a different version, based on your RH OpenShift version.

```bash 
export SI_VERSION=6.2.0.2
```

4) To run playbook the playbook


```bash 
ansible-playbook playbooks/deploy_sb2b.yml
```

MainPage [README.md](../README.md)


# Deploy Sterling B2Bi using prebuilt db.

If your using SB2Bi for a prove of concept and get the environment provided in 10 minutes, i suggest to deploy using prebuilt db.

** You need to have a backup from a previous install, we cannot provide because of copyright **.


1) Define previous environment variables

```bash 
export ENTITLED_REGISTRY_KEY=<entitlement_key>
export SI_INSTANCEID=dev01
export SI_DOMAIN=ocp01-8...74-0000.us-south.containers.appdomain.cloud
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

# Environment Variable
  
| Environment Variable         | Default Value     | Required | Description
|------------------------------|-------------------| ---------|-------------------------------------|
| ENTITLED_REGISTRY_KEY        |                   | Y        | IBM Entitled Registry key |
| SI_INSTANCEID                |                   | Y        | Used to define your environment |
| SI_DOMAIN                    |                   | Y        | Used to define your environment |
| SI_LICENSETYPE               | no-prod           | N        | Specify the license edition as per license agreement. Valid value is **prod** or **non-prod** for Production and Non-production respectively. Remember that this parameter is crucial for IBM Licensing and Metering Service | 
| SI_SYSTEM_PASSPHRASE         | passw0rd          | N        | Name of system passphrase secret if available |
| SI_ADMIN_MAILADDR            | admin@company.com | N        | Provide the admin email address |
| SI_ADMIN_SMTPHOST            | smtp.company.com  | N        | Provide the SMTP host details |
| SI_DBVENDOR                  | DB2               | N        | Database vendor: DB2, Oracle, MSSQL           | 
| SI_DBHOST                    | <from service>    | N        | Database hostname/ip address |
| SI_DBPORT                    | <from service>    | N        | Database port |
| SI_DBNAME                    | B2BI              | N        | Database name |
| SI_DBUSER                    | db2inst1          | N        | Database user |
| SI_DBPASSWORD                | passw0rd          | N        | Database user password |
| SI_ORACLESERVICENAME         | false             | N        | Oracle service name, must be **true** when database is Oracle |
| SI_DATASETUP_ENABLED         | true              | N        | Enable database setup job execution |
| SI_DATASETUP_UPGRADE         | false             | N        | Upgrade an older release |
| SI_JMS_USERNAME              |                   | N        | JMS Queue user |
| SI_JMS_PASSWORD              | passw0rd          | N        | JMS Queue user password |
| SI_JMS_KEYSTORE_PASSWORD     |                   | N        | JMS Queue keystore password |
| SI_JMS_TRUSTSTORE_PASSWORD   |                   | N        | JMS Queue truststore password |
| SI_LIBERTY_KEYSTORE_PASSWORD | changeit          | N        | Liberty keystore password |
| SI_SKIP_HELM                 | false             | N        | Avoid to run helm, only generate values.yaml  |

