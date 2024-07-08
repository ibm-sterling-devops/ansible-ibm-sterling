Role cd_deploy
=========

Deploy Connect:direct


Role Variables
--------------

Environment variables for this role:

| Environment Variable          | Default Value         | Required | Description                                      |
|-------------------------------|-----------------------|----------|--------------------------------------------------|
| ENTITLED_REGISTRY_KEY         | -                     | Yes      | Entitlement registry key                         |
| CD_NAMESPACE                  | sterling-cdnode01-dev | No       | Namespace for C:D application                    |
| CD_NODENAME                   | CDNODE01              | No       | Specify the nodename of C:D                      |
| CD_VERSION                    | 6.3.0.3_ifix003       | No       | Version of C:D container to deploy               |
| CD_ADMINPASSWORD              | passw0rd              | No       | Password for C:D Admin                           |
| CD_APPUSER_PWD                | passw0rd              | No       | Password for C:D User                            |
| CD_LOCALCERTPASSPHRASE        | changeit              | No       | Passphrase for local certificate                 |
| CD_KEYSTOREPASSWORD           | changeit              | No       | Password for keystore                            |
| CD_LICENSE_TYPE               | non-prod              | No       | License type for C:D (prod or non-prod)          |
| CD_STORAGE_CLASS              | -                     | No       | Storage class to be used for the container       |
| CD_STORAGE_CAPACITY           | 1Gi                   | No       | Storage capacity to be allocated to the container|
| CD_CPU_LIMITS                 | 500m                  | No       | CPU limit for the container                      |
| CD_MEM_LIMITS                 | 2000Mi                | No       | Memory limit for the container                   |
| CD_EPHEMERAL_STORAGE_LIMITS   | 5Gi                   | No       | Ephemeral storage limit for the container        |
| CD_CPU_REQUESTS               | 500m                  | No       | CPU request for the container                    |
| CD_MEM_REQUESTS               | 2000Mi                | No       | Memory request for the container                 |
| CD_EPHEMERAL_STORAGE_REQUESTS | 3Gi                   | No       | Ephemeral storage request for the container      |

