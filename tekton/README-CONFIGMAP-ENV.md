# How ConfigMap Variables are Used as Environment Variables

## Overview

The Tekton system is configured to automatically load all variables defined in ConfigMaps as environment variables before executing Ansible playbooks. **Each product has its own specific ConfigMap.**

## ConfigMap Architecture

### Available ConfigMaps by Product

Each Sterling product has its own ConfigMap to avoid conflicts:

| Product | ConfigMap | File |
|---------|-----------|------|
| Connect:Direct | `sterling-cd-config` | `tekton/config/configmap-cd.yaml` |
| Connect:Direct WebService | `sterling-cdws-config` | `tekton/config/configmap-cdws.yaml` |
| SEAS | `sterling-seas-config` | `tekton/config/configmap-seas.yaml` |
| SCC | `sterling-scc-config` | `tekton/config/configmap-scc.yaml` |
| SSP | `sterling-ssp-config` | `tekton/config/configmap-ssp.yaml` |
| B2Bi | `sterling-b2bi-config` | `tekton/config/configmap-b2bi.yaml` |
| MinIO | `sterling-minio-config` | `tekton/config/configmap-minio.yaml` |

## Execution Flow

### 1. Definition in ConfigMap

Variables are defined in product-specific ConfigMaps (e.g., `tekton/config/configmap-cd.yaml`):

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: sterling-cd-config  # Specific name for Connect:Direct
data:
  CD_NAMESPACE: "sterling-cdnode01-dev"
  CD_NODENAME: "CDNODE01"
  CD_VERSION: "6.4.0.3-iFix011-2025-11-03"
  # ... other variables
```

### 2. Pipeline Specifies the ConfigMap

The pipeline (`tekton/pipelines/sterling-deploy-pipeline.yaml`) passes the correct ConfigMap name for each product:

```yaml
- name: cd-deploy
  taskRef:
    name: sterling-deploy-task
  params:
    - name: playbook-path
      value: "playbooks/deploy_cd.yml"
    - name: configmap-name
      value: "sterling-cd-config"  # CD-specific ConfigMap
```

### 3. Task Loads ConfigMap Dynamically

The file `tekton/tasks/sterling-deploy-task.yaml` accepts the ConfigMap name as a parameter:

```yaml
params:
  - name: configmap-name
    description: Name of the ConfigMap containing deployment configuration
    type: string
    default: "sterling-deploy-config"

# ...

envFrom:
  - configMapRef:
      name: $(params.configmap-name)  # Uses the ConfigMap passed as parameter
      optional: true
  - secretRef:
      name: sterling-deploy-secrets
      optional: false
```

**This means that ALL variables from the specified ConfigMap are automatically made available as environment variables in the container.**

### 4. Use in Ansible

Ansible roles use `lookup('env', 'VARIABLE_NAME')` to read these variables:

```yaml
cd_namespace: "{{ lookup('env', 'CD_NAMESPACE') }}"  # Reads $CD_NAMESPACE
cd_nodename: "{{ lookup('env', 'CD_NODENAME') }}"    # Reads $CD_NODENAME
```

## Complete Example: Connect:Direct

### 1. ConfigMap (tekton/config/configmap-cd.yaml)
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: sterling-cd-config
data:
  CD_NAMESPACE: "sterling-cdnode01-dev"
  CD_NODENAME: "CDNODE01"
  CD_VERSION: "6.4.0.3-iFix011-2025-11-03"
  CD_STORAGE_CLASS: ""
  CD_STORAGE_CAPACITY: "1Gi"
```

### 2. Pipeline Task (tekton/pipelines/sterling-deploy-pipeline.yaml)
```yaml
- name: cd-deploy
  taskRef:
    name: sterling-deploy-task
  params:
    - name: playbook-path
      value: "playbooks/deploy_cd.yml"
    - name: configmap-name
      value: "sterling-cd-config"  # Specifies which ConfigMap to use
```

### 3. Available Environment Variables
When the playbook executes, these variables are available:
- `$CD_NAMESPACE` = "sterling-cdnode01-dev"
- `$CD_NODENAME` = "CDNODE01"
- `$CD_VERSION` = "6.4.0.3-iFix011-2025-11-03"
- `$CD_STORAGE_CLASS` = ""
- `$CD_STORAGE_CAPACITY` = "1Gi"

### 4. Use in Ansible (roles/cd_deploy/defaults/main.yml)
```yaml
cd_namespace: "{{ lookup('env', 'CD_NAMESPACE') }}"  # Reads $CD_NAMESPACE
cd_nodename: "{{ lookup('env', 'CD_NODENAME') }}"    # Reads $CD_NODENAME
```

## How to Verify

To verify that variables are available, you can add a debug in the playbook:

```yaml
- name: Debug environment variables
  debug:
    msg:
      - "CD_NAMESPACE: {{ lookup('env', 'CD_NAMESPACE') }}"
      - "CD_NODENAME: {{ lookup('env', 'CD_NODENAME') }}"
      - "CD_VERSION: {{ lookup('env', 'CD_VERSION') }}"
```

Or add to the Tekton Task script:

```bash
echo "CD_NAMESPACE: ${CD_NAMESPACE}"
echo "CD_NODENAME: ${CD_NODENAME}"
echo "CD_VERSION: ${CD_VERSION}"
```

## How to Use for Different Products

### Apply ConfigMaps to Cluster

Before running the pipeline, apply the necessary ConfigMaps:

```bash
# Apply Connect:Direct ConfigMap
kubectl apply -f tekton/config/configmap-cd.yaml

# Apply CDWS ConfigMap
kubectl apply -f tekton/config/configmap-cdws.yaml

# Apply SEAS ConfigMap
kubectl apply -f tekton/config/configmap-seas.yaml

# Apply all at once
kubectl apply -f tekton/config/
```

### Run Pipeline

The pipeline automatically uses the correct ConfigMap for each product:

```bash
# Deploy Connect:Direct (uses sterling-cd-config)
kubectl create -f tekton/runs/deploy-cd.yaml

# Deploy CDWS (uses sterling-cdws-config)
kubectl create -f tekton/runs/deploy-cdws.yaml
```

## Naming Pattern

All products follow the same pattern:

| Product | Variable Prefix | ConfigMap | Example Variable |
|---------|----------------|-----------|------------------|
| CD | `CD_*` | `sterling-cd-config` | `CD_NAMESPACE`, `CD_NODENAME` |
| CDWS | `CDWS_*` | `sterling-cdws-config` | `CDWS_NAMESPACE`, `CDWS_VERSION` |
| SEAS | `SEAS_*` | `sterling-seas-config` | `SEAS_NAMESPACE`, `SEAS_VERSION` |
| SCC | `SCC_*` | `sterling-scc-config` | `SCC_NAMESPACE`, `SCC_VERSION` |
| SSP | `SSP_*` | `sterling-ssp-config` | `SSP_NAMESPACE`, `SSP_VERSION` |
| B2Bi | `SI_*` | `sterling-b2bi-config` | `SI_INSTANCEID`, `SI_VERSION` |
| MinIO | `MINIO_*` | `sterling-minio-config` | `MINIO_NAMESPACE`, `MINIO_REPLICAS` |

## Secrets

Sensitive values (passwords, keys) should be stored in Secrets:

```yaml
envFrom:
  - secretRef:
      name: sterling-deploy-secrets
      optional: false
```

Example Secret variables:
- `ENTITLED_REGISTRY_KEY`
- `CD_ADMINPASSWORD`
- `CD_KEYSTOREPASSWORD`
- `SI_DBPASSWORD`
- `SI_JMS_PASSWORD`
- `SCC_DBPASSWORD`
- `SCC_JMS_PASSWORD`
- `SSP_SYS_PASSPHRASE`

## Modifying Configurations

To modify configuration values:

1. **Edit the appropriate ConfigMap** in `tekton/config/`:
   ```bash
   vi tekton/config/configmap-cd.yaml
   ```

2. **Apply changes to the cluster**:
   ```bash
   kubectl apply -f tekton/config/configmap-cd.yaml
   ```

3. **Run the pipeline normally**:
   ```bash
   kubectl create -f tekton/runs/deploy-cd.yaml
   ```

New variables will be automatically available in the next execution.

## Architecture Advantages

✅ **Isolation**: Each product has its own ConfigMap, avoiding conflicts  
✅ **Flexibility**: Easy to add new products without affecting existing ones  
✅ **Clarity**: ConfigMap name clearly indicates which product it configures  
✅ **Maintainability**: Configurations organized by product  
✅ **Reusability**: Same Tekton task serves all products  

## Conclusion

The system is configured to automatically load variables from the correct ConfigMap as environment variables before executing the Ansible playbook. Each product has its own specific ConfigMap, ensuring isolation and avoiding naming conflicts.