Role itxa_deploy
==========================

Deploy ITXA application


Role Variables
--------------

Environment variables for this role:

| Environment Variable          | Default Value        | Required | Description                                      |
|-------------------------------|----------------------|----------|--------------------------------------------------|
| ENTITLED_REGISTRY_KEY         | N/A                  | Yes      | Entitlement registry key                         |
| ITXA_INSTANCEID               | N/A                  | Yes      | Instance ID for ITXA application                 |
| ITXA_VERSION                  | 10.0.1.9-x86_64      | No       | Version of ITXA application                      |
| ITXA_ADMIN_PASSWORD           | passw0rd             | No       | Admin password for ITXA application              |
| ITXA_TLS_KEYSTORE_PASSWORD    | changeit             | No       | TLS keystore password for ITXA application       |
| ITXA_LICENSETYPE              | non-prod             | No       | License type for ITXA application (prod or non-prod) |
