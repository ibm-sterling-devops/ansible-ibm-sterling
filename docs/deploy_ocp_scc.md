# Deploy IBM Sterling Control Center on OpenShift using Ansible Scripts

# Deploying 

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

export SCC_INSTANCEID=dev01

export SCC_PRODUCTS=CCM,CCD

export SCC_DOMAIN=ocp01-8...74-0000.us-south.containers.appdomain.cloud
```

where SCC_PRODUCTS is the product that you want to install

| Product | Description      |
|---------|------------------------------|
| CCD     | Sterling Control Center Director |
| CCM     | Sterling Control Center Monitor  |


where SCC_DOMAIN is the suffix for your environment

| Environment  | Sample URL      |
|--------------|-------------------------------------------------------|
| IBM Cloud    | ocp01-8...74-0000.us-south.containers.appdomain.cloud |
| IBM Techzone | apps.34...6e.cloud.techzone.ibm.com |



## Run the Plabook

To run playbook the playbook

```bash 
ansible-playbook playbooks/deploy_scc.yml
```

MainPage [README.md](../README.md)


# Advanced options
