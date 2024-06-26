# Deploy IBM Sterling B2B Integrator on OpenShift using Ansible Scripts

## Supported versions

Playbook will run the last version of Sterling B2Bi, but take care of Kubernetes/Openshift version is supported

| Sterling B2Bi (helm) | Kubernetes          | OpenShift           | Helm      |
|----------------------|---------------------|---------------------|-----------|
| 6.2.0.2 (3.0.4)      | >= 1.27 and <= 1.29 | >= 4.14 and <= 4.15 | >= 3.14.x |
| 6.2.0.1 (3.0.1)      | >= 1.26 and <= 1.28 | >= 4.13 and <= 4.14 | >= 3.13.x |
| 6.2.0.0 (3.0.0)      | >= 1.25 and <= 1.27 | >= 4.12 and <= 4.13 | >= 3.12.x |

Check with

```bash 
kubectl version
```

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

export SI_INSTANCEID=dev01

export SI_DOMAIN=ocp01-8...74-0000.us-south.containers.appdomain.cloud
```

Suffix for your environment

| Environment  | Sample URL      |
|--------------|-------------------------------------------------------|
| IBM Cloud    | ocp01-8...74-0000.us-south.containers.appdomain.cloud |
| IBM Techzone | apps.34...6e.cloud.techzone.ibm.com |

(Optional) change your version: 

```bash 
export SI_VERSION=6.2.0.2
```

## Run the Plabook

To run playbook the playbook

```bash 
ansible-playbook playbooks/deploy_sb2b.yml
```

MainPage [README.md](../README.md)


# Advanced options
