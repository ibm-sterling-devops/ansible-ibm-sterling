# Deploy IBM Sterling Connect:Direct WebService on OpenShift using Ansible Scripts

## IBM Entitled Registry

You must have **kubectl**, **oc**, **git** and **ansible** installed in your machine

Log in the [IBM Container software library](https://myibm.ibm.com/products-services/containerlibrary) with the IBMid and password that are associated with the entitled software. Click **Get entitlement key**. With key export variable

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

export ANSIBLE_CONFIG=./ansible.cfg 

export ENTITLED_REGISTRY_KEY=<entitlement_key>

export CDWS_NAMESPACE=sterling-cdws01
```

## Run the Plabook

To run playbook the playbook

```bash 
ansible-playbook playbooks/deploy_cdws.yml
```

check for **sterling-cdws01** namespace in Kubernetes/Openshift console.

# Environment Variable

For all environment variables

* Role [cd_deploy](../../roles/cdws_deploy)