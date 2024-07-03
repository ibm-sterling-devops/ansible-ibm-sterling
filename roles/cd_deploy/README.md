# Role cd_deploy


| Environment Variable      | Default Value           | Required | Description                                      |
|---------------------------|-------------------------|----------|--------------------------------------------------|
| CD_NAMESPACE              | sterling-cdnode01-dev   | No       | Namespace for C:D application                    |
| CD_NODENAME               | CDNODE01                | No       | Specify the node of C:D application              |
| CD_VERSION                | 6.3.0.3_ifix003         | No       | Version of C:D application                       |
| CD_ADMINPASSWORD          | passw0rd                | No       | Admin password for C:D application               |
| CD_APPUSER_PWD            | passw0rd                | No       | Password for application user                    |
| CD_LOCALCERTPASSPHRASE    | changeit                | No       | Passphrase for local certificate                 |
| CD_KEYSTOREPASSWORD       | changeit                | No       | Password for keystore                            |
| CD_LICENSETYPE            | non-prod                | No       | License type for C:D application (prod or non-prod) |
| ENTITLED_REGISTRY_KEY     | N/A                     | Yes      | Entitlement registry key                         |
