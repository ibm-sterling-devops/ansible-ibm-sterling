Role scc_deploy
==========================

Deploy IBM Sterling Control Center application


Role Variables
--------------

Environment variables for this role:

| Environment Variable        | Default Value         | Required | Description                                      |
|-----------------------------|-----------------------|----------|--------------------------------------------------|
| ENTITLED_REGISTRY_KEY       | N/A                   | Yes      | Entitlement registry key                         |
| SCC_INSTANCEID              | N/A                   | Yes      | Instance ID for SCC application                  |
| SCC_PRODUCTS                | ''                    | Yes      | Products for SCC application (CCM,CCD; CCM; CCD) |
| DB2_NAMESPACE               | N/A                   | No       | Namespace for DB2                                |
| SCC_LICENSETYPE             | non-prod              | No       | License type for SCC application (prod or non-prod) |
| SCC_SYSTEM_PASSPHRASE       | passw0rd              | No       | System passphrase for SCC application            |
| SCC_ADMIN                   | admin                 | No       | Admin username for SCC application               |
| SCC_ADMIN_PASSWORD          | passw0rd              | No       | Admin password for SCC application               |
| SCC_TRUSTSTORE_PASSWORD     | changeit              | No       | Truststore password for SCC application          |
| SCC_KEYSTORE_PASSWORD       | changeit              | No       | Keystore password for SCC application            |
| SCC_EMAIL_PASSWORD          | passw0rd              | No       | Email password for SCC application               |
| SCC_DBVENDOR                | N/A                   | No       | Database vendor for SCC application              |
| SCC_DBHOST                  | N/A                   | No       | Database host for SCC application                |
| SCC_DBPORT                  | N/A                   | No       | Database port for SCC application                |
| SCC_DBNAME                  | N/A                   | No       | Database name for SCC application                |
| SCC_DBUSER                  | N/A                   | No       | Database user for SCC application                |
| SCC_DBPASSWORD              | N/A                   | No       | Database password for SCC application            |
| SCC_SMTPHOST                | smtp.company.com      | No       | SMTP host for SCC application                    |
| SCC_SMTPPORT                | 25                    | No       | SMTP port for SCC application                    |
| SCC_EMAIL_RESPOND           | noreply@company.com   | No       | Email respond address for SCC application        |
| SCC_ADMIN_MAILADDR          | admin@company.com     | No       | Admin email address for SCC application          |
| SCC_SMTP_TLSENABLED         | false                 | No       | SMTP TLS enabled for SCC application             |
| SCC_JMS_USERNAME            | N/A                   | No       | JMS username for SCC application                 |
| SCC_JMS_PASSWORD            | N/A                   | No       | JMS password for SCC application                 |
| SCC_JMS_KEYSTORE_PASSWORD   | N/A                   | No       | JMS keystore password for SCC application        |
| SCC_JMS_TRUSTSTORE_PASSWORD | N/A                   | No       | JMS truststore password for SCC application      |
| SCC_TIMEZONE                | America/New_York      | No       | Timezone for SCC application                     |
