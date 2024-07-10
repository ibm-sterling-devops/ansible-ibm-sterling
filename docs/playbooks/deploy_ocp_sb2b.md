# Deploy IBM Sterling B2B Integrator on OpenShift using Ansible Scripts

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

## Deploying Sterling B2B Integrator

1) First you need to provide SI_INSTANCEID, this is used to define your environment. Samples: dev01, dev02, poc01, qa01, prod01

```bash 
export SI_INSTANCEID=dev01
```

2) (Optional) change your version: 

We always run the last version of Sterling B2Bi, but you can choose to run a different version, based on your RH OpenShift version.

```bash 
export SI_VERSION=6.2.0.2
```

3) To run playbook the playbook


```bash 
ansible-playbook playbooks/deploy_sb2b.yml
```

## Deploy Sterling B2Bi using prebuilt db.

If your using SB2Bi for a prove of concept and get the environment provided in 10 minutes, i suggest to deploy using prebuilt db.

!!! tip
    You need to have a backup from a previous install, we cannot provide because of copyright


1) Define previous environment variables

```bash 
export SI_INSTANCEID=dev01
```

2) Provide your Sterling B2BI database backup

```bash 
export SI_PREBUILTDB_FILE=/tmp/B2BI_6202.tar.gz
```

3) disable database setup and upgrade

```bash 
export SI_DATASETUP_ENABLED=false
export SI_DATASETUP_UPGRADE=false
```

4) Run prebuilt playbook

```bash 
ansible-playbook playbooks/deploy_sb2b_prebuiltdb.yml
```

## Environment Variable

For all environment variables

* Role [sb2bi_deploy](../../roles/sb2bi_deploy)
* Role [sb2bi_setup_db2](../../roles/sb2bi_setup_db2)
* Role [sb2bi_deploy_db2](../../roles/sb2bi_deploy_db2)
* Role [sb2bi_deploy_mq](../../roles/sb2bi_deploy_mq)

* Role [sb2bi_prebuiltdb_db2](../../roles/sb2bi_prebuiltdb_db2)