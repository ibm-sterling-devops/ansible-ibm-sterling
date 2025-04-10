# Deploy IBM Sterling External Authentication Server on OpenShift using Ansible Scripts

Playbook will run the last version of SEAS, but take care of Kubernetes/Openshift version is supported

| SEAS                      | OpenShift           | Kubernetes          | helm-chart |
|---------------------------|---------------------|---------------------|------------|
| 6.1.0.2.01                | >= 4.13 and <= 4.16 | >=1.26.0 <=1.30.0   | 1.5.1      |
| 6.1.0.1.01.1              | >= 4.13 and <= 4.16 | >=1.26.0 <=1.30.0   | 1.4.3      |
| 6.1.0.1.01                | >= 4.13 and <= 4.16 | >=1.26.0 <=1.30.0   | 1.4.2      |


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

## Deploying Sterling External Authentication Server

1) To run the playbook

```bash 
ansible-playbook playbooks/deploy_seas.yml
```

## Change the default namespace

1) Change namespace and run the playbook

```bash 
export SEAS_NAMESPACE=sterling-seas-dev01

ansible-playbook playbooks/deploy_seas.yml
```

## Environment Variable

Environment variables for this role:

| Environment Variable          | Default Value        | Required | Description                                      |
|-------------------------------|----------------------|----------|--------------------------------------------------|
| ENTITLED_REGISTRY_KEY         | N/A                  | Yes      | Entitlement registry key                         |
| SEAS_NAMESPACE                | N/A                  | No       | Namespace for SEAS application                   |
| SEAS_VERSION                  | 6.1.0.0.06           | No       | Version of SEAS application                      |
| SEAS_SYS_PASSPHRASE           | Password123!         | No       | System passphrase for SEAS application           |
| SEAS_ADMIN_PASSWORD           | Password123!         | No       | Admin password for SEAS application              |
| SEAS_KEYSTORE_PASSPHRASE      | Change1t@            | No       | Keystore passphrase for SEAS application         |
| SEAS_TRUSTSTOREPASSWORD       | Change1t@            | No       | Truststore passphrase for SEAS application       |
| SEAS_LICENSETYPE              | non-prod             | No       | License type for SEAS application (prod or non-prod) |
