# Deploy Kafka on OpenShift using Ansible Scripts

Using Strimzi or Redhat operator

## Preparation

#### 1. Login on OpenShift

Do a login in Openshift console and run the command:

```bash 
oc login --token=sha256~P...k --server=https://c....containers.cloud.xxx.com:31234
```

#### 2. Cloning ansible-ibm-websphere from git

```bash 
git clone https://github.com/ibm-sterling-devops/ansible-ibm-sterling.git
```

#### 3. Set roles path

To run playbook the playbook

```bash 
cd ansible-ibm-sterling

export ANSIBLE_CONFIG=./ansible.cfg 
```

## Deploy Cloud beaver 

#### 1. Run the Playbook

To run playbook the playbook

```bash 
ansible-playbook playbooks/tools/kafka.yml
```

## Environment Variable

For all environment variables

* Role [kafka](../../roles/kafka)