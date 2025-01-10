Role sb2bi_setup_db2
==========================

This role will perform some initial setup on the Db2 instance that is needed to prepare it for use with the Sterling B2B.

The role will copy a bash script (setupdb.sh) into the Db2 pod and execute it inside the container, this script will perform a number of configuration changes to the database like 'CREATE DATABASE, CREATE TABLESPACES, ...'.

Role Variables
--------------
Environment variables for this role:

| Environment Variable          | Default Value        | Required | Description                                      |
|-------------------------------|----------------------|----------|--------------------------------------------------|
| ENTITLED_REGISTRY_KEY         | N/A                  | Yes      | Entitlement registry key                         |
| SI_INSTANCEID                 | N/A                  | Yes      | Instance ID for SB2BI application                 |
