# Deploy IBM Sterling Transformation Extender on OpenShift using Ansible Scripts

Playbook will run the last version of ITXA, but take care of Kubernetes/Openshift version is supported

| ITX RS                    | OpenShift           | Kubernetes          | helm-chart |
|---------------------------|---------------------|---------------------|------------|
| 10.1.2.0.20231130         | >= 4.13 and <= 4.15 | >=1.26.0 <1.29.0    | 2.1.0      |

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


## Deploy ITX RS

1) Define namespace

```bash 
export ITX_RS_NAMESPACE=ibm-itx-rs-dev01
```

2) To run the playbook

```bash 
ansible-playbook playbooks/deploy_itx_rs.yml
```

# Environment Variable

Environment variables for this role:

| Environment Variable        | Default Value          | Required | Description                                      |
|-----------------------------|------------------------|----------|--------------------------------------------------|
| ENTITLED_REGISTRY_KEY       | N/A                    | Yes      | Entitlement registry key                         |
| ITX_RS_NAMESPACE            | N/A                    | Yes      | Namespace for ITX application                    |
| ITX_RS_INSTANCEID           | N/A                    | Yes      | Instance ID for ITX application                  |
| ITX_RS_VERSION              | 10.1.2.0.20231130      | No       | Version of ITX application                       |
| ITX_RS_SYS_PASSPHRASE       | Passw0rd@              | No       | System passphrase for ITX application            |
