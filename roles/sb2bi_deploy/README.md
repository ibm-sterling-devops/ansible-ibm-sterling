Role sb2b_deploy
=========

Deploy Sterling B2B Integrator


Role Variables
--------------
Environment variables for this role:

| Environment Variable         | Default Value     | Required | Description
|------------------------------|-------------------| ---------|-------------------------------------|
| ENTITLED_REGISTRY_KEY        |                   | Yes      | IBM Entitled Registry key |
| SI_INSTANCEID                |                   | Yes      | Used to define your environment |
| SI_LICENSETYPE               | no-prod           | No       | Specify the license edition as per license agreement. Valid value is **prod** or **non-prod** for Production and Non-production respectively. Remember that this parameter is crucial for IBM Licensing and Metering Service | 
| SI_SYSTEM_PASSPHRASE         | passw0rd          | No       | Name of system passphrase secret if available |
| SI_ADMIN_MAILADDR            | admin@company.com | No       | Provide the admin email address |
| SI_ADMIN_SMTPHOST            | smtp.company.com  | No       | Provide the SMTP host details |
| SI_DBVENDOR                  | DB2               | No       | Database vendor: DB2, Oracle, MSSQL           | 
| SI_DBHOST                    | <from service>    | No       | Database hostname/ip address |
| SI_DBPORT                    | <from service>    | No       | Database port |
| SI_DBNAME                    | B2BI              | No       | Database name |
| SI_DBUSER                    | db2inst1          | No       | Database user |
| SI_DBPASSWORD                | passw0rd          | No       | Database user password |
| SI_ORACLESERVICENAME         | false             | No       | Oracle service name, must be **true** when database is Oracle |
| SI_DATASETUP_ENABLED         | true              | No       | Enable database setup job execution |
| SI_DATASETUP_UPGRADE         | false             | No       | Upgrade an older release |
| SI_JMS_USERNAME              |                   | No       | JMS Queue user |
| SI_JMS_PASSWORD              | passw0rd          | No       | JMS Queue user password |
| SI_JMS_KEYSTORE_PASSWORD     |                   | No       | JMS Queue keystore password |
| SI_JMS_TRUSTSTORE_PASSWORD   |                   | No       | JMS Queue truststore password |
| SI_LIBERTY_KEYSTORE_PASSWORD | changeit          | No       | Liberty keystore password |
| SI_SKIP_HELM                 | false             | No       | Avoid to run helm, only generate values.yaml  |

