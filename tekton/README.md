# Tekton Pipelines for IBM Sterling Deployments (v3)

Complete Tekton pipeline solution for deploying all IBM Sterling products with parallel and sequential execution support.

## Pipeline Architecture

```
Sterling Deployer
  ├─> Connect:Direct: CD
  ├─> Connect:Direct WebServices: CDWS
  ├─> SEAS: SEAS
  ├─> Sterling B2Bi: DB2 > Setup DB2 > MQ > B2Bi
  ├─> Sterling Control Center (SCC): DB2 > Setup DB2 > SCC
  └─> Sterling Secure Proxy (SSP): CM > Engine > PS > Config
```

## Directory Structure

```
tekton/
├── README.md                              # Original docs
├── Dockerfile                             # Custom image
├── scripts/
│   └── setup-credentials.sh              # Credential setup helper
├── tasks/
│   └── ansible-deploy-task.yaml       # Enhanced task
├── pipelines/
│   └── sterling-complete-pipeline.yaml     # v1 pipeline
├── runs/
│   ├── deploy-all.yaml       # Deploy everything
│   ├── deploy-b2bi.yaml      # B2Bi only
│   ├── deploy-cd.yaml        # CD only
│   ├── deploy-cdws.yaml      # CDWS only
│   ├── deploy-seas.yaml      # SEAS only
│   └── deploy-ssp.yaml       # SSP only
└── config/
    ├── configmap-cd.yaml          # Connect:Direct configuration
    ├── configmap-cdws.yaml        # Connect:Direct WebService configuration
    ├── configmap-seas.yaml        # SEAS configuration
    ├── configmap-scc.yaml         # SCC configuration
    ├── configmap-ssp.yaml         # SSP configuration
    ├── configmap-b2bi.yaml        # B2Bi configuration
    ├── configmap-minio.yaml       # MinIO configuration
    └── secret-template.yaml       # Sensitive data template
```

## Execution Times (Approximate)

| Product | Time      | Notes |
|---------|-----------|-------|
| MinIO   | 10-15 min |  |
| CD      | 15-20 min |  |
| CDWS    | 15-20 min |  |
| SEAS    | 10-15 min |  |
| B2Bi    | 60-90 min |  |
| SCC     | 45-60 min |  |
| SSP     | 20-30 min |  |

## Quick Start

### 1. Prerequisites

* OpenShift cluster access
* Tekton Pipelines installed
* IBM Entitlement Registry Key


### 2. Login to OpenShift

```bash
oc login --server=https://your-cluster:6443 --token=your-token
```

### 3. Setup Credentials

```bash
export ENTITLED_REGISTRY_KEY="your-entitlement-key"

./tekton/scripts/setup-credentials.sh
```

### 4. Configure Products

Edit the ConfigMaps for the products you want to deploy:

```bash
# Edit Connect:Direct configuration
vi tekton/config/configmap-cd.yaml

# Edit B2Bi configuration
vi tekton/config/configmap-b2bi.yaml

# Edit SCC configuration
vi tekton/config/configmap-scc.yaml

# Edit SSP configuration
vi tekton/config/configmap-ssp.yaml
```

**Important:** Each product has its own ConfigMap with specific variables:
- `configmap-b2bi.yaml` - Variables prefixed with `SI_*`
- `configmap-cd.yaml` - Variables prefixed with `CD_*`
- `configmap-cdws.yaml` - Variables prefixed with `CDWS_*`
- `configmap-scc.yaml` - Variables prefixed with `SCC_*`
- `configmap-seas.yaml` - Variables prefixed with `SEAS_*`
- `configmap-ssp.yaml` - Variables prefixed with `SSP_*`
- `configmap-minio.yaml` - Variables prefixed with `MINIO_*`

### 5. Apply ConfigMaps

Apply the ConfigMaps for the products you want to deploy:

```bash
# Apply all ConfigMaps
kubectl apply -f tekton/config/

# Or apply specific ConfigMaps
kubectl apply -f tekton/config/configmap-cd.yaml
kubectl apply -f tekton/config/configmap-b2bi.yaml
kubectl apply -f tekton/config/configmap-scc.yaml
```

### 6. Install Tekton Resources

```bash
# Install Tekton Task
kubectl apply -f tekton/tasks/sterling-deploy-task.yaml -n sterling-deployer

# Install Tekton Pipeline
kubectl apply -f tekton/pipelines/sterling-deploy-pipeline.yaml -n sterling-deployer
```

### 7. Deploy Products

Choose your deployment scenario:

#### Deploy All Sterling Suite Products (CD, CDWS, SEAS, SCC, B2Bi, SSP):
```bash
kubectl create -f tekton/runs/deploy-all.yaml -n sterling-deployer
```

#### Deploy B2Bi Only:
```bash
kubectl create -f tekton/runs/deploy-b2bi.yaml -n sterling-deployer
```

#### Deploy SCC Only:
```bash
kubectl create -f tekton/runs/deploy-scc.yaml -n sterling-deployer
```

#### Deploy SSP Only:
```bash
kubectl create -f tekton/runs/deploy-ssp.yaml -n sterling-deployer
```

### 8. Monitor Execution

```bash
# List pipeline runs
kubectl get pipelineruns -n sterling-deployer

# Watch specific run
kubectl get pipelinerun deploy-sterling-all -w -n sterling-deployer

# View logs
tkn pipelinerun logs deploy-sterling-all -f 
```

## Deployment Scenarios

### Scenario 1: All Products (tekton/run/deploy-all.yaml)

```yaml
params:
  - name: deploy-minio
    value: "true"
  - name: deploy-cd
    value: "true"
  - name: deploy-cdws
    value: "true"
  - name: deploy-seas
    value: "true"
  - name: deploy-b2bi
    value: "true"
  - name: deploy-scc
    value: "true"
  - name: deploy-ssp
    value: "true"
```



### Scenario 3: B2Bi Only  (tekton/run/deploy-b2bi.yaml)

```yaml
params:
  - name: deploy-b2bi
    value: "true"
  # All others: false or not provided
```

## Credentials Management

### ENTITLED_REGISTRY_KEY

- Set via Secret (`sterling-deploy-secrets`)
- Persisted across all pipeline tasks
- Available to all Ansible playbooks

### OpenShift Login

- Maintained in shared workspace
- KUBECONFIG at `$(workspace)/.kube/config`
- Available to all tasks

### Setup Script

`setup-credentials.sh` handles:
- OpenShift login verification
- Secret creation/update
- Service account configuration
- Permission setup

## Troubleshooting

### Pipeline Fails to Start

```bash
# Check task
kubectl get task sterling-deploy-task -n 

# Check pipeline
kubectl get pipeline sterling-deploy-pipeline

# Describe PipelineRun
kubectl describe pipelinerun deploy-all
```

### Credentials Issues

```bash
# Verify secret
kubectl get secret sterling-deploy-secrets -o yaml

# Re-run setup
./tekton/scripts/setup-credentials.sh
```

### Task Fails

```bash
# View logs
tkn pipelinerun logs deploy-sterling-all -f

# Check specific task
kubectl logs -l tekton.dev/pipelineTask=deploy-cd -f
```

### Workspace Issues

```bash
# Check PVC
kubectl get pvc

# Delete and recreate
kubectl delete pipelinerun deploy-sterling-all
kubectl create -f tekton/runs/deploy-all.yaml
```

## Advanced Usage

### Custom Product Selection

Create your own PipelineRun:

```yaml
apiVersion: tekton.dev/v1beta1
kind: PipelineRun
metadata:
  name: deploy-custom
spec:
  pipelineRef:
    name: sterling-complete-pipeline-v3
  params:
    - name: deploy-minio
      value: "true"
    - name: deploy-cd
      value: "true"
    - name: deploy-cdws
      value: "false"
    - name: deploy-seas
      value: "true"
    - name: deploy-b2bi
      value: "false"
    - name: deploy-scc
      value: "true"
    - name: deploy-ssp
      value: "false"
  workspaces:
    - name: shared-data
      volumeClaimTemplate:
        spec:
          accessModes:
            - ReadWriteOnce
          resources:
            requests:
              storage: 2Gi
  timeout: 4h0m0s
  serviceAccountName: tekton-deployer-sa
```

### Timeout Adjustment

```yaml
spec:
  timeout: 8h0m0s  # Increase for large deployments
```



**Total (All Products):** ~2-3 hours (with parallelization)

## Support

For issues:
- Check troubleshooting section
- Review logs carefully
- Open issue in GitHub repository
