* Deploy IBM Sterling Connect:Direct on OpenShift using Ansible Scripts

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
export CD_NAMESPACE=sterling-cdnode01-dev
export CD_NODENAME=CDNODE01
```

## Run the Plabook

To run playbook the playbook

```bash 
ansible-playbook playbooks/deploy_ocd_cd.yml
```


MainPage [README.md](../README.md)