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

* [Deploy IBM Sterling Connect:Direct on Redhat OpenShift](docs/deploy_ocp_cd.md)
* [Deploy IBM Sterling Connect:Direct Web Service on Redhat OpenShift](docs/deploy_ocp_cdws.md)
* [Deploy IBM Sterling Transformation Server on Redhat OpenShift](docs/deploy_ocp_itx_rs.md)
* [Deploy IBM Sterling Transformation Extender Advanced on Redhat OpenShift](docs/deploy_ocp_itxa.md)
* [Deploy IBM Sterling B2B Integrator on Redhat OpenShift ](docs/deploy_ocp_sb2b.md)
* [Deploy IBM Sterling Control Center Director/Monitor on Redhat OpenShift ](docs/deploy_ocp_scc.md)
* [Deploy IBM Sterling External Authentication Server on Redhat OpenShift ](docs/deploy_ocp_seas.md)
* [Deploy IBM Sterling Proxy Server on Redhat OpenShift (Engine, Configuration Manager, Perimeter) ](docs/deploy_ocp_seas.md)



# Contributors

See the list of [contributors](https://github.com/ibm-sterling-devops/ansible-ibm-sterling/contributors) who participated in this project.

# License

This project is licensed under the Eclipse Public License - v 2.0 - see the [LICENSE.md](LICENSE.md) file for details

## Disclaimer

This repository is a community-driven projects and is not officially supported or endorsed by IBM. While members of the community may include IBM employees, this project is independent of IBM's official support channels. Please note that any contributions, issues, or inquiries regarding this repository should be directed to the community maintainers and not to IBM's support teams. We appreciate your understanding and participation in this community-driven initiative.

This code can be used as is. And any feedback will be welcome. We does not make any warranty about the completeness, reliability and accuracy of this code. Any action you take by using this code is strictly at your own risk, and this project will not be liable for any losses and damages in connection with the use of this code.
