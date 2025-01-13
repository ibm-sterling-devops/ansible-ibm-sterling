# Deploy IBM Sterling Partner Engagement Manager on RedHat OpenShift

Playbook will run the last version of IBM Sterling Partner Engagement Manager, but take care of Kubernetes/Openshift version is supported

| Sterling PEM              | OpenShift           | Kubernetes          | helm-chart | Helm      |
|---------------------------|---------------------|---------------------|------------|-----------|
| 6.2.3.2                   | >= 4.14             | >= 1.27             | 1.3.2      | >= 3.15.x |


## Deploying Sterling PEM

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

### 5. Deploying Sterling PEM

1) First you need to provide PEM_INSTANCEID, this is used to define your environment. Samples: dev01, dev02, poc01, qa01, prod01

```bash 
export PEM_INSTANCEID=dev01
```

2) To run playbook the playbook

```bash 
ansible-playbook playbooks/deploy_pem.yml
```


## Deploying Sterling PEM with Community Manager

1) Deploy Serling B2Bi

You need to provide to install a **production** Sterling B2Bi

```bash 
export SI_INSTANCEID=prd01

ansible-playbook playbooks/deploy_sb2b.yml
```

You need to provide to install a **non-production** Sterling B2Bi

```bash 
export SI_INSTANCEID=dev01

ansible-playbook playbooks/deploy_sb2b.yml
```

After install change admin password to 'Password123!'

2) Now you need to provide PEM_INSTANCEID and PEM_CM_ENABLE

```bash 
export PEM_INSTANCEID=dev01
export PEM_CM_ENABLE=true
```

3) To run playbook the playbook

```bash 
ansible-playbook playbooks/deploy_pem.yml
```


## Environment Variable

Environment variables for this role:

| Environment Variable          | Default Value     | Required | Description
|-------------------------------|-------------------| ---------|-------------------------------------|
| ENTITLED_REGISTRY_KEY         |                   | Yes      | IBM Entitled Registry key |
| PEM_INSTANCEID                |                   | Yes      | Used to define your environment |
| PEM_ACTION                    | install           | No       | Action: install, upgrade, prebuiltdb           |
| PEM_DEFAULT_PASSWORD          | Password123!      | No       | Default Password for PEM applications|
| PEM_DEFAULT_PASSPHRASE        | P@ssPhr4s3_890@   | No       | Default Passphrase for PEM applications|
| PEM_KEYSTORE_PASSWORD         | Change1t@         | No       | Default Password for Keystores and Truststore|
| PEM_ADMIN_MAILADDR            | admin@company.com | No       | Provide the admin email address |
| PEM_SMTPHOST                  | smtp.company.com  | No       | Provide the SMTP host details |
| PEM_SMTPPORT                  | 25                | No       | Provide the SMTP host details |
| PEM_DBVENDOR                  | DB2               | No       | Database vendor: DB2, Oracle, MSSQL           | 
| PEM_DBHOST                    | <from service>    | No       | Database hostname/ip address |
| PEM_DBPORT                    | <from service>    | No       | Database port |
| PEM_DBNAME                    | PEMDB             | No       | Database name |
| PEM_DBUSER                    | db2inst1          | No       | Database user |
| PEM_DBPASSWORD                | passw0rd          | No       | Database user password |
| PEM_DBSCHEMA                  | DB2INST1          | No       | Database user password |
| PEM_JMS_USERNAME              |                   | No       | JMS Queue user |
| PEM_JMS_PASSWORD              | passw0rd          | No       | JMS Queue user password |
| PEM_JMS_KEYSTORE_PASSWORD     |                   | No       | JMS Queue keystore password |
| PEM_JMS_TRUSTSTORE_PASSWORD   |                   | No       | JMS Queue truststore password |
| PEM_SKIP_HELM                 | false             | No       | Avoid to run helm, only generate values.yaml  |
| PEM_CM_ENABLE                 | false             | No       | Enable/Disable PEM Community Manager  |

For all environment variables

* Role [pem_setup_db2](../../roles/pem_setup_db2)
* Role [pem_deploy_db2](../../roles/pem_deploy_db2)
* Role [pem_deploy_mq](../../roles/pem_deploy_mq)
