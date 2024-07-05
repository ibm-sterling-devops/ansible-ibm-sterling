Role ssp_deploy
=========

Deploy Sterling Secure Proxy Engine application


Role Variables
--------------
Environment variables for this role:

| Environment Variable                | Default Value   | Required | Description                                      |
|-------------------------------------|-----------------|----------|--------------------------------------------------|
| ENTITLED_REGISTRY_KEY               | N/A             | Yes      | Entitlement registry key                         |
| SSP_INSTANCEID                      | N/A             | Yes      | Instance ID for SSP application                  |
| SSP_VERSION                         | 6.1.0.0.03plus  | No       | Version of SSP application                       |
| SSP_LICENSE_TYPE                    | non-prod        | No       | License type for SSP application (prod or non-prod) |
| SSP_SYS_PASSPHRASE                  | Passw0rd@       | No       | System passphrase for SSP application            |
| SSP_KEYCERT_STORE_PASSPHRASE        | changeit        | No       | Keystore and certificate store passphrase        |
| SSP_KEYCERT_ENCRYPT_PASSPHRASE      | Change1t@       | No       | Encryption passphrase for keys and certificates  |
| SSP_CUSTOM_KEYCERT_PASSPHRASE       | Change1t@       | No       | Custom keystore passphrase for SSP application  |
| SSP_TIMEZONE                        | America/New_York| No       | Timezone for SSP application                    |
