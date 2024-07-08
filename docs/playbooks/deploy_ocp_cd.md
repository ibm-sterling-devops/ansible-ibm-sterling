# Deploy IBM Sterling Connect:Direct on OpenShift using Ansible Scripts

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


## Deploy you Connect:Direct 

#### Exporting variables

To run playbook the playbook

```bash 
cd ansible-ibm-sterling

export ANSIBLE_CONFIG=./ansible.cfg 

export CD_NODENAME=CDNODE01
```

#### Run the Plabook

To run playbook the playbook

```bash 
ansible-playbook playbooks/deploy_cd.yml
```

check for **sterling-cdnode01-dev** namespace. The C:D node name will be **CDNODE01**


## Sample 1: Change namespace and C:D node name

#### Exporting variables

To run playbook the playbook

```bash 
cd ansible-ibm-sterling

export CD_NAMESPACE=sterling-cdcompany01-prod
export CD_NODENAME=COMPANY01
```

#### Run the Plabook

To run playbook the playbook

```bash 
ansible-playbook playbooks/deploy_cd.yml
```

# Environment Variable

For all environment variables

* Role [cd_deploy](../../roles/cd_deploy)
