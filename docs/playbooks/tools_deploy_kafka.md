# Deploy Kafka on OpenShift using Ansible Scripts

Using Strimzi or Redhat operator

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
```

## Run the Plabook

To run playbook the playbook

```bash 
ansible-playbook playbooks/tools/kafka.yml
```

