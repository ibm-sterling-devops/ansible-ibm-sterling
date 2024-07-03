Role ssp_ps_deploy
=========

Deploy Sterling Secure Proxy Perimeter Server application


Role Variables
--------------
Environment variables for this role:

| Environment Variable                | Default Value   | Required | Description                                      |
|-------------------------------------|-----------------|----------|--------------------------------------------------|
| ENTITLED_REGISTRY_KEY               | N/A             | Yes      | Entitlement registry key                         |
| SSP_INSTANCEID                      | N/A             | Yes      | Instance ID for SSP application                  |
| SSP_VERSION                         | 6.1.0.0.03plus  | No       | Version of SSP application                       |
| SSP_LICENSETYPE                     | non-prod        | No       | License type for SSP application (prod or non-prod) |
