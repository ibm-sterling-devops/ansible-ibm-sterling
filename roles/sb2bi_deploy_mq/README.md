Role sb2bi_deploy_mq
=========

Deploy MQ for Sterling B2Bi application


Role Variables
--------------
Environment variables for this role:

| Environment Variable          | Default Value        | Required | Description                                      |
|-------------------------------|----------------------|----------|--------------------------------------------------|
| ENTITLED_REGISTRY_KEY         | N/A                  | Yes      | Entitlement registry key                         |
| SI_INSTANCEID                | N/A                  | Yes      | Instance ID for SB2Bi application                 |
| MQ_NAME                       | mq                   | No       | Name for MQ                                      |
| MQ_VERSION                    | 9.2.5.0-r3           | No       | Version of MQ                                    |
| MQ_ADMIN_PASSWORD             | passw0rd             | No       | Admin password for MQ                            |
| MQ_APP_PASSWORD               | passw0rd             | No       | Application password for MQ                      |