Role scc_deploy_mq
=========

Deploy MQ for Sterling Control Center application


Role Variables
--------------
Environment variables for this role:

| Environment Variable          | Default Value        | Required | Description                                      |
|-------------------------------|----------------------|----------|--------------------------------------------------|
| ENTITLED_REGISTRY_KEY         | N/A                  | Yes      | Entitlement registry key                         |
| SCC_INSTANCEID                | N/A                  | Yes      | Instance ID for Control Center application       |
| MQ_NAME                       | mq                   | No       | Name for MQ                                      |
| MQ_VERSION                    | 9.2.5.0-r3           | No       | Version of MQ                                    |
| MQ_ADMIN_PASSWORD             | passw0rd             | No       | Admin password for MQ                            |
| MQ_APP_PASSWORD               | passw0rd             | No       | Application password for MQ                      |