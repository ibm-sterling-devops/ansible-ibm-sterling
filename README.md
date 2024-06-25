# ansible-ibm-sterling
Ansible collection supporting devops for IBM Sterling B2Bi, IBM Connect:Direct, Seas, ...


# Playbooks

| Playbook name                 | Status         |           Description                                        |
|-------------------------------|----------------|--------------------------------------------------------------|
| setup-cd.yml                  | Complete       | Install IBM Connect:Direct 6.2.x |
| setup-sb2b.yml                | Complete       | Install IBM Sterling B2B Integrator 6.1.2  - one node only |
| setup-db2.yml                 | Complete       | Install IBM DB2 11.5.x and setup Sterling B2Bi Database |
| setup-nginx.yml               | Complete       | Install Nginx as HTTP server for Repository|    
| deploy_cd.yml                 | Complete       | Deploy IBM Connect:Direct 6.3.x on Redhat OpenShift |
| deploy_sb2b.yml               | Complete       | Deploy IBM Sterling B2B Integrator on Redhat OpenShift |
| tools/cloudbeaver.yml         | Complete       | Deploy CloudBeaver CE to manage databases |
| tools/openldap.yml            | Complete       | Deploy OpenLDAP as LDAP Server |

# Roles

See complete list of [Roles](roles/README.md)


# Getting start

## Running playbooks for standalone

* [Install Connect:Direct (standalone)](docs/setup_cd.md)
* [Install Sterling B2B Integrator (standalone)](docs/setup_b2b.md)


## Deploy IBM Connect:Direct 6.3.x on Redhat OpenShift

You must have **kubectl**, **oc**, **git** and **ansible** installed in your machine

Log in the [IBM Container software library](https://myibm.ibm.com/products-services/containerlibrary) with the IBMid and password that are associated with the entitled software. Click **Get entitlement key**. With key export variable

```bash 
export ENTITLED_REGISTRY_KEY=eyJ0...
```

Do a login in Openshift console and run the command:

```bash 
oc login --token=sha256~P...k --server=https://c....containers.cloud.xxx.com:31234
```


To run playbook the playbook

```bash 
cd ansible-ibm-sterling


export CD_NAMESPACE=ibm-cd-cdnode01-dev
export CD_NODENAME=CDNODE01

ansible-playbook playbooks/deploy_cd.yml
```

More options [Deploy IBM Sterling Connect:Direct on OpenShift using Ansible Scripts](docs/deploy_ocp_cd.md)

## Deploy IBM Sterling B2B Integrator on Redhat OpenShift

See documentation [Deploy IBM Sterling B2B Integrator on OpenShift using Ansible Scripts](docs/deploy_ocp_sb2b.md)

# Contributors

See the list of [contributors](https://github.com/ibm-sterling-devops/ansible-ibm-sterling/contributors) who participated in this project.

# License

This project is licensed under the Eclipse Public License - v 2.0 - see the [LICENSE.md](LICENSE.md) file for details

## Disclaimer

This product is not officially supported, and can be used as is. And any feedback will be welcome. We does not make any warranty about the completeness, reliability and accuracy of this code. Any action you take by using this code is strictly at your own risk, and this project will not be liable for any losses and damages in connection with the use of this code.
