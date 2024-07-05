Role ssp_cm_deploy
=========

Deploy Sterling Secure Proxy Configuration Manager application


Role Variables
--------------
Environment variables for this role:

| Environment Variable                | Default Value   | Required | Description                                      |
|-------------------------------------|-----------------|----------|--------------------------------------------------|
| ENTITLED_REGISTRY_KEY               | N/A             | Yes      | Entitlement registry key                         |
| SSP_INSTANCEID                      | N/A             | Yes      | Instance ID for SSP CM application               |
| SSP_VERSION                         | 6.1.0.0.03plus  | No       | Version of SSP CM application                   |
| SSP_LICENSE_TYPE                    | non-prod        | No       | License type for SSP CM application (prod or non-prod) |
| SSP_SYS_PASSPHRASE                  | Passw0rd@       | No       | System passphrase for SSP CM application        |
| SSP_ADMIN_PASSWORD                  | Passw0rd@       | No       | Admin password for SSP CM application           |
| SSP_KEYCERT_STORE_PASSPHRASE        | changeit        | No       | Keystore and certificate store passphrase       |
| SSP_KEYCERT_ENCRYPT_PASSPHRASE      | Change1t@       | No       | Encryption passphrase for keys and certificates |
| SSP_CUSTOM_KEYCERT_PASSPHRASE       | Change1t@       | No       | Custom keystore passphrase for SSP CM          |
| SSP_COMMONCERT_PASSWORD             | Passw0rd@       | No       | Password for common certificate                |
| SSP_ENGCERT_PASSWORD                | Passw0rd@       | No       | Password for engine certificate                |
| SSP_CMCLIENTCERT_PASSWORD           | Passw0rd@       | No       | Password for CM client certificate             |
| SSP_CMCERT_PASSWORD                 | Passw0rd@       | No       | Password for CM certificate                    |
| SSP_CMSERVERCERT_PASSWORD           | Passw0rd@       | No       | Password for CM server certificate             |
| SSP_WEBCERT_PASSWORD                | Passw0rd@       | No       | Password for web certificate                   |
| SSP_EXPORTEDCERT_PASSWORD           | Passw0rd@       | No       | Password for exported certificate             |
