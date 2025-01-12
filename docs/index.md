IBM Sterling Devops Ansible
===============================================================================

IBM Sterling Devops Project is an open source project to deploy IBM Sterling Products and other resources directly from the command line.

Developed in Ansible, it provides a collection of playbooks and roles that automated deploy for IBM Sterling B2Bi, IBM Connect:Direct, ... on Redhat OpenShift.

GitHub Repository: [https://github.com/ibm-sterling-devops/ansible-ibm-sterling/](https://github.com/ibm-sterling-devops/ansible-ibm-sterling/)

**Requirements**

To use ansible scripts you must have ansible, kubectl, oc, git, helm installed. See requirements on navigation.

Current playbooks:

**Deploy Sterling Products on Redhat OpenShift / Kubernetes**

* [Deploy IBM Sterling Connect:Direct](playbooks/deploy_ocp_cd.md)
* [Deploy IBM Sterling Connect:Direct Web Service](playbooks/deploy_ocp_cdws.md)
* [Deploy IBM Sterling B2B Integrator](playbooks/deploy_ocp_sb2b.md)
* [Deploy IBM Sterling Control Center Director/Monitor](playbooks/deploy_ocp_scc.md)
* [Deploy IBM Sterling External Authentication Server](playbooks/deploy_ocp_seas.md)
* [Deploy IBM Sterling Secure Proxy Server (Engine, Configuration Manager, Perimeter)](playbooks/deploy_ocp_ssp.md)
* [Deploy IBM Sterling Partner Engagement Manager](playbooks/deploy_ocp_pem.md)
* [Deploy IBM Sterling Transformation Server](playbooks/deploy_ocp_itx_rs.md)
* [Deploy IBM Sterling Transformation Extender Advanced](playbooks/deploy_ocp_itxa.md)

**Install Sterling Products (standalone)**

* Install Connect:Direct (standalone)
* Install Sterling B2B Integrator (standalone)



**Contributors**

See the list of [contributors](https://github.com/ibm-sterling-devops/ansible-ibm-sterling/contributors) who participated in this project.

**License**

This project is licensed under the Eclipse Public License - v 2.0 - see the [LICENSE](https://github.com/ibm-sterling-devops/ansible-ibm-sterling/LICENSE) file for details

**Disclaimer**

This repository is a community-driven projects and is not officially supported or endorsed by IBM. While members of the community may include IBM employees, this project is independent of IBM's official support channels. Please note that any contributions, issues, or inquiries regarding this repository should be directed to the community maintainers and not to IBM's support teams. We appreciate your understanding and participation in this community-driven initiative.

This code can be used as is. And any feedback will be welcome. We does not make any warranty about the completeness, reliability and accuracy of this code. Any action you take by using this code is strictly at your own risk, and this project will not be liable for any losses and damages in connection with the use of this code.

