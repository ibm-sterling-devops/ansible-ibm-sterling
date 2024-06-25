# ansible-ibm-sterling
Ansible collection supporting devops for IBM Sterling B2Bi, IBM Connect:Direct, Seas, ...


# Playbooks

| Playbook name            | Status         |           Description                                        |
|--------------------------|----------------|--------------------------------------------------------------|
| setup-cd.yml             | Complete       | Install IBM Connect:Direct 6.2.x |
| setup-sb2b.yml           | Complete       | Install IBM Sterling B2B Integrator 6.1.2  - one node only |
| setup-db2.yml            | Complete       | Install IBM DB2 11.5.x and setup Sterling B2Bi Database |
| setup-nginx.yml          | Complete       | Install Nginx as HTTP server for Repository|    
| deploy_cd.yml            | Complete       | Deploy IBM Connect:Direct 6.3.x on Redhat OpenShift |
| deploy_cdws.yml          | Complete       | Deploy IBM Connect:Direct WebServices on Redhat OpenShift |
| deploy_itx_rs.yml        | Complete       | Deploy IBM Sterling Transformation Server on Redhat OpenShift |
| deploy_itxa.yml          | Complete       | Deploy IBM Sterling Transformation Advanced on Redhat OpenShift |
| deploy_sb2b.yml          | Complete       | Deploy IBM Sterling B2B Integrator on Redhat OpenShift |
| deploy_scc.yml           | Complete       | Deploy IBM Sterling Control Center Monitor/Director on Redhat OpenShift |
| deploy_seas.yml          | Complete       | Deploy IBM Sterling External Authentication Server on Redhat OpenShift |
| deploy_ssp.yml           | Complete       | Deploy IBM Sterling Secure Proxy Server on Redhat OpenShift |
| tools/cloudbeaver.yml    | Complete       | Deploy CloudBeaver CE to manage databases |
| tools/openldap.yml       | Complete       | Deploy OpenLDAP as LDAP Server |

# Roles

See complete list of [Roles](roles/README.md)


# Install Sterling Products (standalone)

* [Install Connect:Direct (standalone)](docs/setup_cd.md)
* [Install Sterling B2B Integrator (standalone)](docs/setup_b2b.md)


# Deploy Sterling Products on Redhat OpenShift / Kubernetes

* [Deploy IBM Sterling Connect:Direct on OpenShift using Ansible Scripts](docs/deploy_ocp_cd.md)
* [Deploy IBM Sterling B2B Integrator on OpenShift using Ansible Scripts](docs/deploy_ocp_sb2b.md)



# Contributors

See the list of [contributors](https://github.com/ibm-sterling-devops/ansible-ibm-sterling/contributors) who participated in this project.

# License

This project is licensed under the Eclipse Public License - v 2.0 - see the [LICENSE.md](LICENSE.md) file for details

## Disclaimer

This product is not officially supported, and can be used as is. And any feedback will be welcome. We does not make any warranty about the completeness, reliability and accuracy of this code. Any action you take by using this code is strictly at your own risk, and this project will not be liable for any losses and damages in connection with the use of this code.
