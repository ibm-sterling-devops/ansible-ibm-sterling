# Deploy IBM Sterling Connect:Direct WebService on OpenShift using Ansible Scripts

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

### 3. Cloning ansible-ibm-websphere from git

```bash 
git clone https://github.com/ibm-sterling-devops/ansible-ibm-sterling.git
```

### 4. Set roles path

To run playbook the playbook

```bash 
cd ansible-ibm-sterling

export ANSIBLE_CONFIG=./ansible.cfg 
```

## Deploy you Connect:Direct WebService

1) To run the playbook

```bash 
ansible-playbook playbooks/deploy_cdws.yml
```

check for **sterling-cdws01** namespace in Kubernetes/Openshift console.

## Examples

### Example 1: Change namespace and C:D node name

To change namespace/project and C:D node name

```bash 
cd ansible-ibm-sterling

export CDWS_NAMESPACE=sterling-cdws01

ansible-playbook playbooks/deploy_cd.yml
```


## Environment Variable

For all environment variables

* Role [cd_deploy](../../roles/cdws_deploy)