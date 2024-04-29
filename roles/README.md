# Standard Roles

| Role name                       | Status     |            Description of Role                                          |
|---------------------------------|--------------|-------------------------------------------------------------------------|
| ibm/cd-unix/cd-install          | Complete     | Install IBM Connect:Direct |
| ibm/cd-unix/cd-start            | Complete     | Start Connect:Direct |
| ibm/cd-unix/cd-stop             | Complete     | Stop Connect:Direct |
| ibm/db2/create-sb2b-db          | Complete     | setup Sterling B2Bi Database |
| ibm/db2/db2-install             | Complete     | Install IBM DB2 |
| ibm/db2/db2-restart             | Complete     | Stop and Start IBM DB2 |
| ibm/db2/db2-start               | Complete     | Start IBM DB2 |
| ibm/db2/db2-stop                | Complete     | Stop IBM DB2 |
| ibm/sb2b/sb2b-api-setup         | Complete     | Config B2B REST API |
| ibm/sb2b/sb2b-server-install    | Complete     | Install IBM Sterling B2B |
| ibm/sb2b/sb2b-start             | Complete     | Start SB2Bi |
| ibm/sb2b/sb2b-stop              | Complete     | Stop SB2Bi |
| others/nginx-install            | Complete     | Install Nginx |

# Kubernetes Roles

| Role name                     | Status         |           Description                                        |
|-------------------------------|----------------|--------------------------------------------------------------|
| cd_deploy                     | Complete       | Deploy IBM Sterling Connect:Direct |
| mq_deploy                     | Complete       | Deploy IBM Message Queue Community Edition |
| sb2bi_deploy                  | Complete       | Deploy IBM Sterling B2B Integrator  |
| sb2bi_deploy_db2              | Complete       | Deploy IBM DB2 database for Sterling B2B|
| sb2bi_deploy_mq               | Complete       | Deploy IBM Message Queue Community Edition for Sterling B2B |
| sb2bi_setup_db2               | Complete       | Setup database for IBM Sterling B2B |
| scc_deploy                    | Development    | Deploy IBM Sterling Control Center Monitor (SCCM) or Control Center Director (SCCD)|
| scc_deploy_db2                | Development    | Deploy IBM DB2 database for SCCM or SCCD|
| scc_deploy_mq                 | Development    | Deploy IBM Message Queue Community Edition for SCCM or SCCD|
| scc_setup_db2                 | Development    | Setup database for IBM SCCM or SCCD|
| seas_deploy                   | Complete       | Setup SEAS|
| ssp_cm_deploy                 | Development    | Setup database for IBM Sterling Secure Proxy Configuration Manager|
| ssp_deploy                    | Development    | Setup database for IBM Sterling Secure Proxy Engine|
| ssp_ps_deploy                 | Development    | Setup database for IBM Sterling Secure Proxy Perimeter Server|

## Tools 

| Role name                     | Status         |           Description                                        |
|-------------------------------|----------------|--------------------------------------------------------------|
| cloudbeaver.yml               | Complete       | Deploy CloudBeaver CE to manage databases |
| db2_console                   | Development    | Deploy DB2 Data Management Console |
| openldap.yml                  | Complete       | Deploy OpenLDAP as LDAP Server |