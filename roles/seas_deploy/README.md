Role seas_deploy
=========

Deploy Sterling External Authentication application


Role Variables
--------------
Environment variables for this role:

| Environment Variable          | Default Value        | Required | Description                                      |
|-------------------------------|----------------------|----------|--------------------------------------------------|
| ENTITLED_REGISTRY_KEY         | N/A                  | Yes      | Entitlement registry key                         |
| SEAS_NAMESPACE                | N/A                  | Yes      | Namespace for SEAS application                   |
| SEAS_VERSION                  | 6.1.0.0.06           | No       | Version of SEAS application                      |
| SEAS_SYS_PASSPHRASE           | Passw0rd@            | No       | System passphrase for SEAS application           |
| SEAS_ADMIN_PASSWORD           | Passw0rd@            | No       | Admin password for SEAS application              |
| SEAS_KEYSTORE_PASSPHRASE      | Change1t@            | No       | Keystore passphrase for SEAS application         |
| SEAS_TRUSTSTOREPASSWORD       | Change1t@            | No       | Truststore passphrase for SEAS application       |
| SEAS_LICENSETYPE              | non-prod             | No       | License type for SEAS application (prod or non-prod) |
