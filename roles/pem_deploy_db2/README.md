Role pem_deploy_db2
=========

Deploy DB2 for PEM application


Role Variables
--------------
Environment variables for this role:

| Environment Variable          | Default Value        | Required | Description                                      |
|-------------------------------|----------------------|----------|--------------------------------------------------|
| ENTITLED_REGISTRY_KEY         | N/A                  | Yes      | Entitlement registry key                         |
| PEM_INSTANCEID                | N/A                  | Yes      | Instance ID for PEM application                  |
| DB2_PASSWORD                  | passw0rd             | No       | DB2 db2inst1 password                            |
| DB2_VERSION                   | 11.5.9.0             | No       | DB2 Version                                      |