Role itxa_deploy_db2
==========================

Deploy DB2 for ITXA application


Role Variables
--------------
Environment variables for this role:

| Environment Variable          | Default Value        | Required | Description                                      |
|-------------------------------|----------------------|----------|--------------------------------------------------|
| ENTITLED_REGISTRY_KEY         | N/A                  | Yes      | Entitlement registry key                         |
| ITXA_INSTANCEID               | N/A                  | Yes      | Instance ID for ITXA application                 |
| DB2_PASSWORD                  | passw0rd             | No       | DB2 db2inst1 password                            |
| DB2_VERSION                   | 11.5.9.0             | No       | DB2 Version                                      |
