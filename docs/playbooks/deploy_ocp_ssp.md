# Deploy IBM Sterling Secure Proxy on OpenShift using Ansible Scripts

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

## Deploying Sterling Secure Proxy

1) First you need to provide SSP_INSTANCEID, this is used to define your environment. Samples: dev01, dev02, poc01, qa01, prod01

```bash 
export SSP_INSTANCEID=dev01
```

2) To run the playbook

```bash 
ansible-playbook playbooks/dev_ssp.yml
```

## Environment Variable

For all environment variables

* Role [ssp_cm_deploy](../../roles/ssp_cm_deploy)
* Role [ssp_deploy](../../roles/ssp_deploy)
* Role [ssp_ps_deploy](../../roles/ssp_ps_deploy)
* Role [ssp_config](../../roles/ssp_config)
