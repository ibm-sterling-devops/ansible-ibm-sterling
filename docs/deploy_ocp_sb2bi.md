# Deploy IBM Sterling B2B Integrator on OpenShift using Ansible Scripts

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

## Exporting variables

To run playbook the playbook

```bash 
cd ansible-ibm-sterling

export SI_NAMESPACE=sterling-b2bi-dev
export MQ_NAMESPACE=sterling-b2bi-mq-dev
export DB_NAMESPACE=sterling-b2bi-db2-dev
```

## Run the Plabook

To run playbook the playbook

```bash 
ansible-playbook playbooks/deploy_ocp_sb2bi.yml
```

MainPage [README.md](../README.md)


# Advanced options

```
export ENTITLED_REGISTRY_KEY=<entitlement_key>

export SB2BI_INSTANCE_ID=sterling-b2bi-dev

oc login --token=sha256~KpQBSI.... --server=https://api.ocp-27000....:6443
```
