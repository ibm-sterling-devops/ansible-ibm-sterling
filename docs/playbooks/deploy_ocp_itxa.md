# Deploy IBM Sterling Transformation Server on OpenShift using Ansible Scripts

Playbook will run the last version of ITXA, but take care of Kubernetes/Openshift version is supported

| ITXA                      | OpenShift           | Kubernetes          | helm-chart |
|---------------------------|---------------------|---------------------|------------|
| 10.0.1.10-x86_64          | >= 4.13 and <= 4.15 | >=1.26.0 <1.29.0    | 1.0.4      |
| 10.0.1.9-x86_64           | >= 4.13 and <= 4.15 | >=1.26.0 <1.29.0    | 1.0.2      |

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

## Deploy ITXA

1) First you need to provide ITXA_INSTANCEID, this is used to define your environment. Samples: dev01, dev02, poc01, qa01, prod01

```bash 
export ITXA_INSTANCEID=dev01
```

2) To run the playbook

```bash 
ansible-playbook playbooks/deploy_itxa.yml
```

# Environment Variable

Environment variables for this role:

| Environment Variable          | Default Value        | Required | Description                                      |
|-------------------------------|----------------------|----------|--------------------------------------------------|
| ENTITLED_REGISTRY_KEY         | N/A                  | Yes      | Entitlement registry key                         |
| ITXA_INSTANCEID               | N/A                  | Yes      | Instance ID for ITXA application                 |
| ITXA_VERSION                  | 10.0.1.9-x86_64      | No       | Version of ITXA application                      |
| ITXA_ADMIN_PASSWORD           | passw0rd             | No       | Admin password for ITXA application              |
| ITXA_TLS_KEYSTORE_PASSWORD    | changeit             | No       | TLS keystore password for ITXA application       |
| ITXA_LICENSETYPE              | non-prod             | No       | License type for ITXA application (prod or non-prod) |

