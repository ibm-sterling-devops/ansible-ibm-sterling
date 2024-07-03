Role sb2bi_prebuiltdb_db2
==========================

This role will restore database from a previous instance. Only to be used for Proof of Concept (PoC).

The role will copy a bash script (restoredb.sh) into the Db2 pod and execute it inside the container, this script will perform a number of configuration changes to the database like 'CREATE DATABASE, RESTORE DATABASE, ...'.

Role Variables
--------------
Environment variables for this role:

| Environment Variable          | Default Value        | Required | Description                                      |
|-------------------------------|----------------------|----------|--------------------------------------------------|
| ENTITLED_REGISTRY_KEY         | N/A                  | Yes      | Entitlement registry key                         |
| SI_INSTANCEID                 | N/A                  | Yes      | Instance ID for SB2BI application                |
| SI_PREBUILTDB_FILE            | N/A                  | Yes      | full path to backup file              |
