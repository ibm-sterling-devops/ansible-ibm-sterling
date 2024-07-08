Role cdws_deploy
=========

Deploy Connect:direct Webservices


Role Variables
--------------

Environment variables for this role:

| Environment Variable        | Default Value   | Required | Description                                      |
|-----------------------------|-----------------|----------|--------------------------------------------------|
| ENTITLED_REGISTRY_KEY       | N/A             | Yes      | Entitlement registry key                         |
| CDWS_NAMESPACE              | sterling-cdws01 | Yes      | Namespace for C:D application                    |
| CDWS_VERSION                | 6.3.0.8_ifix000 | No       | Version of C:D container to deploy               |
| CDWS_TRUSTSTOREPASSWORD     | changeit        | No       | Password for truststore                          |
| CDWS_KEYSTOREPASSWORD       | changeit        | No       | Password for keystore                            |
| CDWS_CACERT_PASSWORD        | passw0rd        | No       | Password for CA certificate                      |
| CDWS_LICENSE_TYPE           | non-prod        | No       | License type for C:D application (prod or non-prod) |
| CDWS_STORAGE_CLASS          | -               | Yes      | Storage class to be used for the container            |
| CDWS_STORAGE_CAPACITY       | 500Mi           | No       | Storage capacity to be allocated to the container     |
| CDWS_CPU_LIMITS             | 3000m           | No       | CPU limit for the container                           |
| CDWS_MEM_LIMITS             | 2Gi             | No       | Memory limit for the container                        |
| CDWS_CPU_REQUESTS           | 1500m           | No       | CPU request for the container                         |
| CDWS_MEM_REQUESTS           | 1Gi             | No       | Memory request for the container                      |
