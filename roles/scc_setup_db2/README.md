sb2bi_setup_db2
==========================

This role will perform some initial setup on the Db2 instance that is needed to prepare it for use with the Sterling B2Bi.

The role will copy a bash script (setupdb.sh) into the Db2 pod and execute it inside the container, this script will perform a number of configuration changes to the database like 'CREATE DATABASE, CREATE TABLESPACES, ...'.

Role Variables
--------------
### si_instanceid
The instance id of the Sterling B2Bi to execute the setup in.

- **Required**
- Environment Variable: `SI_INSTANCEID`
- Default Value: None

### db2_namespace
The namespace where the Db2 instance is running.

- Default Value: `sterling-b2bi-{{ si_instanceid }}-db2`

### db2_instance_name

The name of the db2 instance to execute the setup in.

- Default Value: `db2inst1`

### db2_username
The username that will be used to connect to the database specified by `db2_dbname`.

- Default Value: `db2inst1`

### db2_dbname
The name of the database in the instance to connect to when executing the setup script.

- Default Value: `B2BI`

### db2_container
The name of the container to connect to when executing the setup script.

- Default Value: `mydb2`

License
-------

EPL-2.0
