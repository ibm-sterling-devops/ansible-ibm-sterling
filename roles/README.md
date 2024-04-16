# Standard Roles

| Role name                       |            Description of Role                                          |
|---------------------------------|-------------------------------------------------------------------------|
| ibm/cd-unix/cd-install          | Install IBM Connect:Direct |
| ibm/cd-unix/cd-start            | Start Connect:Direct |
| ibm/cd-unix/cd-stop             | Stop Connect:Direct |
| ibm/db2/create-sb2b-db          | setup Sterling B2Bi Database |
| ibm/db2/db2-install             | Install IBM DB2 |
| ibm/db2/db2-restart             | Stop and Start IBM DB2 |
| ibm/db2/db2-start               | Start IBM DB2 |
| ibm/db2/db2-stop                | Stop IBM DB2 |
| ibm/sb2b/sb2b-api-setup         | Config B2B REST API |
| ibm/sb2b/sb2b-server-install    | Install IBM Sterling B2B |
| ibm/sb2b/sb2b-start             | Start SB2Bi |
| ibm/sb2b/sb2b-stop              | Stop SB2Bi |
| others/nginx-install            | Install Nginx |

# Kubernetes Roles

| Playbook name                 | Status         |           Description                                        |
|-------------------------------|----------------|--------------------------------------------------------------|
| cd_deploy                     | Complete       | Deploy IBM Sterling Connect:Direct |
| cloudbeaver                   | Complete       | Deploy CloudBeaver Community Edition |
| db2_console                   | Development    | Deploy DB2 Data Management Console |
| mq_deploy                     | Complete       | Deploy IBM Message Queue Community Edition |
| openldap                      | Development    | Deploy OpenLDAP (LDAP Server) |
| sb2bi_deploy                  | Complete       | Deploy IBM Sterling B2B Integrator  |
| sb2bi_deploy_db2              | Complete       | Deploy IBM DB2 database |
| sb2bi_deploy_mq               | Complete       | Deploy IBM Message Queue Community Edition for Sterling B2B |
| sb2bi_setup_db2               | Complete       | Setup database for IBM Sterling B2B |
