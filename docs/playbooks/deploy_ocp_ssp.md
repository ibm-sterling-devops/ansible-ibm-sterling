# Deploy IBM Sterling Secure Proxy on OpenShift using Ansible Scripts

Playbook will run the last version of SEAS, but take care of Kubernetes/Openshift version is supported

| Sterling Secure Proxy     | OpenShift           | Kubernetes          | helm-chart |
|---------------------------|---------------------|---------------------|------------|
| 6.2.1.1-iFix00-2025-10-15 | >= 4.13 and <= 4.16 | >=1.26.0 <=1.30.0   | 1.6.1      |
| 6.2.0.1.02                | >= 4.13 and <= 4.16 | >=1.26.0 <=1.30.0   | 1.5.4      |
| 6.2.0.0.01                | >= 4.13 and <= 4.16 | >=1.26.0 <=1.30.0   | 1.5.1      |
| 6.2.0.0                   | >= 4.13 and <= 4.16 | >=1.26.0 <=1.30.0   | 1.4.0      |
## Preparation

### 1. IBM Entitled Registry

You must have **kubectl**, **oc**, **git** and **ansible** installed in your machine

Log in the [IBM Container software library](https://myibm.ibm.com/products-services/containerlibrary) with the IBMid and password that are associated with the entitled software. Click **Get entitlement key**. With key export variable

```bash 
export ENTITLED_REGISTRY_KEY=<entitlement_key>
```

### 2. Login on OpenShift

Do a login in Openshift console and run the command:

```bash 
oc login --token=sha256~P...k --server=https://c....containers.cloud.xxx.com:31234
```

### 3. Cloning ansible-ibm-sterling from git

```bash 
git clone https://github.com/ibm-sterling-devops/ansible-ibm-sterling.git
```

### 4. Set roles path

To run playbook the playbook

```bash 
cd ansible-ibm-sterling

export ANSIBLE_CONFIG=./ansible.cfg 
```

## Deploying Sterling Secure Proxy

1) First you need to provide SSP_INSTANCEID, this is used to define your environment. Samples: dev01, dev02, poc01, qa01, prod01

```bash 
export SSP_INSTANCEID=dev01
```

2) To run the playbook

```bash 
ansible-playbook playbooks/deploy_ssp.yml
```

## Post-Deployment Steps

After you have deployed Sterling Secure Proxy (SSP) on OpenShift, follow these post-deployment steps to ensure your installation is successful and production-ready:

```
Replace `ibm-ssp-dev01-cm` if you provide another SSP_INSTANCEID
```

### 1. Verify Pod and Service Status

Check that all SSP pods are running without errors:

```bash
oc get pods -n ibm-ssp-dev01-cm
```

### 2. Login on OpenShift

Access the OpenShift console and click on your user icon in the upper-right corner to retrieve your login command.

![Copy Login](./images/get_oc_login.png)

Click on **Display Token**, and copy the oc login command and paste it into your terminal. Sample:

```bash 
oc login --token=sha256~P...k --server=https://c....containers.cloud.xxx.com:31234
```

Get clean password

echo <value from adminPassword> | base64 -d

### 3. Test Connectivity

Confirm that the SSP service is accessible via the route (or ingress) created:

```bash
oc get routes -n ibm-ssp-dev01-cm
```
Open the provided URL in a browser to check application access.

Provide Admin user and password from previous step.



## Environment Variable

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


For all environment variables

* Role [ssp_deploy](../../roles/ssp_deploy)
* Role [ssp_ps_deploy](../../roles/ssp_ps_deploy)
* Role [ssp_config](../../roles/ssp_config)
