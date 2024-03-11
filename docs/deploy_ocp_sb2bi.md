* Deploy IBM Sterling B2B Integrator on OpenShift using Ansible Scripts

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

export ENTITLED_REGISTRY_KEY=<entitlement_key>
export SI_NAMESPACE=sterling-b2bi-dev
export MQ_NAMESPACE=sterling-b2bi-mq-dev
export DB_NAMESPACE=sterling-b2bi-mq-dev
```

## Run the Plabook

To run playbook the playbook

```bash 
ansible-playbook playbooks/deploy_ocp_sb2bi.yml
```


# Advanced options

```
export ENTITLED_REGISTRY=cp.icr.io
export ENTITLED_REGISTRY_USER=cp
export ENTITLED_REGISTRY_KEY=<entitlement_key>

export SB2BI_INSTANCE_ID=sterling-b2bi-dev

oc login --token=sha256~KpQBSI.... --server=https://api.ocp-27000....:6443
```
