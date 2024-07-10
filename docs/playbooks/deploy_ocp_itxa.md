# Deploy IBM Sterling Transformation Server on OpenShift using Ansible Scripts

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

For all environment variables

* Role [itxa_deploy](../../roles/itxa_deploy)
* Role [itxa_setup_db2](../../roles/itxa_setup_db2)
* Role [itxa_deploy_db2](../../roles/itxa_deploy_db2)
