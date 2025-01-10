Role pem_deploy
=========

Deploy Sterling PEM 


Role Variables
--------------
Environment variables for this role:

| Environment Variable          | Default Value     | Required | Description
|-------------------------------|-------------------| ---------|-------------------------------------|
| ENTITLED_REGISTRY_KEY         |                   | Yes      | IBM Entitled Registry key |
| PEM_INSTANCEID                |                   | Yes      | Used to define your environment |
| PEM_DBVENDOR                  | DB2               | No       | Database vendor: DB2, Oracle, MSSQL           | 
| PEM_DBHOST                    | <from service>    | No       | Database hostname/ip address |
| PEM_DBPORT                    | <from service>    | No       | Database port |
| PEM_DBNAME                    | B2BI              | No       | Database name |
| PEM_DBUSER                    | db2inst1          | No       | Database user |
| PEM_DBPASSWORD                | passw0rd          | No       | Database user password |
| PEM_SKIP_HELM                 | false             | No       | Avoid to run helm, only generate values.yaml  |

