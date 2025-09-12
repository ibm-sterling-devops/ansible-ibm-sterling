# Deploy IBM Sterling Connect:Direct on OpenShift using Ansible Scripts

Playbook will run the last version of Connect:Direct, but take care of Kubernetes/Openshift version is supported

| Connect:Direct            | OpenShift           | Kubernetes          | helm-chart | 
|---------------------------|---------------------|---------------------|------------|
| 6.4.0.2-iFix008-2025-08-21| >= 4.15 and <= 4.20 | >=1.28.0 <1.34.0    | 1.4.9      |
| 6.4.0.1_iFix029           | >= 4.14 and <= 4.18 | >=1.27.0 <1.32.0    | 1.4.4      |
| 6.4.0.1_iFix018           | >= 4.14 and <= 4.18 | >=1.27.0 <1.32.0    | 1.4.3      |
| 6.4.0.1_iFix001           | >= 4.14 and <= 4.18 | >=1.27.0 <1.32.0    | 1.4.2      |
| 6.3.0.3_ifix025           | >= 4.11 and <= 4.16 | >=1.24.0 <1.30.0    | 1.3.13     |

## Preparation

### 1. IBM Entitled Registry

You must have **kubectl**, **oc**, **git** and **ansible** installed in your machine

Log in the [IBM Container software library](https://myibm.ibm.com/products-services/containerlibrary) with the IBMid and password that are associated with the entitled software. Click **Get entitlement key**. With key export variable

```bash 
export ENTITLED_REGISTRY_KEY=<entitlement_key>
```

### 2. Login on OpenShift

Access the OpenShift console and click on your user icon in the upper-right corner to retrieve your login command.

![Copy Login](./images/get_oc_login.png)

Click on **Display Token**, and copy the oc login command and paste it into your terminal. Sample:

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


## Deploy you Connect:Direct 

1) Define C:D node name

```bash 
export CD_NODENAME=CDNODE01
```

2) To run the playbook

```bash 
ansible-playbook playbooks/deploy_cd.yml
```

check for **sterling-cdnode01-dev** namespace. The C:D node name will be **CDNODE01**




## Examples

### Example 1: Change namespace and C:D node name

To change namespace/project and C:D node name

```bash 
cd ansible-ibm-sterling

export CD_NAMESPACE=sterling-cdcompany01-prod
export CD_NODENAME=COMPANY01

ansible-playbook playbooks/deploy_cd.yml
```

# Environment Variable

For all environment variables

Role Variables
--------------

Environment variables for this role:

| Environment Variable          | Default Value         | Required | Description                                      |
|-------------------------------|-----------------------|----------|--------------------------------------------------|
| ENTITLED_REGISTRY_KEY         | -                     | Yes      | Entitlement registry key                         |
| CD_NAMESPACE                  | sterling-cdnode01-dev | No       | Namespace for C:D application                    |
| CD_NODENAME                   | CDNODE01              | No       | Specify the nodename of C:D                      |
| CD_VERSION                    | 6.4.0.2-iFix008-2025-08-21| No       | Version of C:D container to deploy               |
| CD_ADMINPASSWORD              | passw0rd              | No       | Password for C:D Admin                           |
| CD_APPUSER_PWD                | passw0rd              | No       | Password for C:D User                            |
| CD_LOCALCERTPASSPHRASE        | changeit              | No       | Passphrase for local certificate                 |
| CD_KEYSTOREPASSWORD           | changeit              | No       | Password for keystore                            |
| CD_LICENSE_TYPE               | non-prod              | No       | License type for C:D (prod or non-prod)          |
| CD_STORAGE_CLASS              | -                     | No       | Storage class to be used for the container       |
| CD_STORAGE_CAPACITY           | 1Gi                   | No       | Storage capacity to be allocated to the container|
| CD_CPU_LIMITS                 | 500m                  | No       | CPU limit for the container                      |
| CD_MEM_LIMITS                 | 2000Mi                | No       | Memory limit for the container                   |
| CD_EPHEMERAL_STORAGE_LIMITS   | 5Gi                   | No       | Ephemeral storage limit for the container        |
| CD_CPU_REQUESTS               | 500m                  | No       | CPU request for the container                    |
| CD_MEM_REQUESTS               | 2000Mi                | No       | Memory request for the container                 |
| CD_EPHEMERAL_STORAGE_REQUESTS | 3Gi                   | No       | Ephemeral storage request for the container      |
