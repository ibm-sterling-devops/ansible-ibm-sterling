IBM Sterling Devops Ansible
===============================================================================

Usage
-------------------------------------------------------------------------------

# Run a playbook
The collection includes a number of playbooks that string together multiple roles, you can directly invoke them after installing the collection:


# Deploying Sterling B2B Integrator

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

Change directory

```bash 
cd ansible-ibm-sterling
```

## Run playbook the playbook

1) First you need to provide SI_INSTANCEID, this is used to define your environment. Samples: dev01, dev02, poc01, qa01, prod01

```bash 
export SI_INSTANCEID=dev01
```

2) Provide de url domain SI_DOMAIN

```bash 
export SI_DOMAIN=ocp01-8...74-0000.us-south.containers.appdomain.cloud
```

You can get this information from your OpenShift console url:

| Environment  | Sample URL      |
|--------------|-------------------------------------------------------|
| IBM Cloud    | ocp01-8...74-0000.us-south.containers.appdomain.cloud |
| IBM Techzone | apps.34...6e.cloud.techzone.ibm.com |

3) (Optional) change your version: 

We always run the last version of Sterling B2Bi, but you can choose to run a different version, based on your RH OpenShift version.

```bash 
export SI_VERSION=6.2.0.2
```

4) To run playbook the playbook


```bash 
ansible-playbook playbooks/deploy_sb2b.yml
```


Local Install for MacOS
-------------------------------------------------------------------------------

Using Brew to install

```bash
    brew install python3 pip3 ansible
```


Local Install for Linux
-------------------------------------------------------------------------------
### Install Python & Ansible
[Python 3.9](https://www.python.org/downloads/) is recommended as it is the most widely used version of Python within our development team, but any in-support 3.x version of Python should work fine.

```bash
python3 --version
python3 -m pip install ansible junit_xml xmljson jmespath kubernetes openshift
ansible --version
ansible-playbook --version
```

Local Install for MS Windows
-------------------------------------------------------------------------------

```bash
    
```

Support
-------------------------------------------------------------------------------
This Ansible collection is developed by community, for any problem [raise an issue directly in the GitHub repository](https://github.com/ibm-sterling-deops/ansible-ibm-sterling/issues).

