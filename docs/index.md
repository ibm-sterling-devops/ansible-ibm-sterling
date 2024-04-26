IBM Sterling Devops Ansible
===============================================================================

Usage
-------------------------------------------------------------------------------
### Run a playbook
The collection includes a number of playbooks that string together multiple roles, you can directly invoke them after installing the collection:

#### To run deploy Connect:Direct

```bash
export ENTITLED_REGISTRY_KEY=<entitlement_key>
export CD_NAMESPACE=sterling-cdnode01-dev
export CD_NODENAME=CDNODE01

ansible-playbook playbooks/deploy_cd.yml
```

#### To run deploy Sterling B2Bi

```bash
export ENTITLED_REGISTRY_KEY=<entitlement_key>
export SI_INSTANCEID=dev01
export SI_DOMAIN=ocp01-8...74-0000.us-south.containers.appdomain.cloud

ansible-playbook playbooks/deploy_sb2bi.yml
```


Local Install
-------------------------------------------------------------------------------
### Install Python & Ansible
[Python 3.9](https://www.python.org/downloads/) is recommended as it is the most widely used version of Python within our development team, but any in-support 3.x version of Python should work fine.

```bash
python3 --version
python3 -m pip install ansible junit_xml xmljson jmespath kubernetes==12.0.1 openshift==0.12.1
ansible --version
ansible-playbook --version
```


Support
-------------------------------------------------------------------------------
This Ansible collection is developed by community, for any problem [raise an issue directly in the GitHub repository](https://github.com/ibm-sterling-deops/ansible-ibm-sterling/issues).

