Role cdws_deploy
=========

Deploy Connect:direct Webservices


Role Variables
--------------

Environment variables for this role:

| Environment Variable        | Default Value          | Required | Description                                      |
|-----------------------------|------------------------|----------|--------------------------------------------------|
| ENTITLED_REGISTRY_KEY       | N/A                    | Yes      | Entitlement registry key                         |
| CDWS_NAMESPACE              | sterling-cdws01        | Yes      | Namespace for C:D application                    |
| CDWS_VERSION                | 6.3.0.8_ifix000        | No       | Version of C:D container to deploy               |
| CDWS_TRUSTSTOREPASSWORD     | changeit               | No       | Password for truststore                          |
| CDWS_KEYSTOREPASSWORD       | changeit               | No       | Password for keystore                            |
| CDWS_CACERT_PASSWORD        | passw0rd               | No       | Password for CA certificate                      |
| CDWS_LICENSETYPE            | non-prod               | No       | License type for C:D application (prod or non-prod) |
