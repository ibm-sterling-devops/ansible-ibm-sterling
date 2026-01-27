# Tekton Pipelines for IBM Sterling Deployments (v3)

Complete Tekton pipeline solution for deploying all IBM Sterling products with parallel and sequential execution support.

## 🎯 Overview

This enhanced v3 pipeline architecture supports:

- ✅ **Parallel Execution**: MinIO, CD, CDWS, SEAS deploy simultaneously
- ✅ **Sequential B2Bi**: DB2 > Setup > MQ > Deploy
- ✅ **Sequential SCC**: DB2 > Setup > Deploy
- ✅ **Sequential SSP**: CM > Engine > Config
- ✅ **Individual Control**: Separate parameters for each product
- ✅ **Persistent Credentials**: ENTITLED_REGISTRY_KEY and oc login maintained
- ✅ **Shared Workspace**: Git repo and credentials persist across all tasks

## 📊 Pipeline Architecture

```
┌─────────────────────────────────────┐
│   Sterling Complete Pipeline        │
└─────────────────────────────────────┘
                         │
        ┌────────────────┼────────────────┼────────────────┼────────────────┐
        ▼                ▼                ▼                ▼                ▼
┌──────────────┐  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐  ┌──────────────┐
│ B2Bi         │  │ SCC          │ │ CD / CDWS    │ │ SSP          │  │ SEAS         │
├──────────────┤  ├──────────────┤ ├──────────────┤ ├──────────────┤  └──────────────┘
│ 1. DB2       │  │ 1. DB2       │ │ • CD         │ │ • CM         │
│ 2. Setup DB2 │  │ 2. Setup DB2 │ │ • CDWS       │ │ • Engine     │
│ 3. MQ        │  │ 3. Deploy    │ │              │ │ • PS         │
│ 4. Deploy    │  │              │ │              │ │              │
└──────────────┘  └──────────────┘ └──────────────┘ └──────────────┘  
```

## 📁 Directory Structure

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
    ├── configmap-cd.yaml
    ├── configmap-cdws.yaml
    └── secret-template.yaml
```

## 🚀 Quick Start

### 1. Prerequisites

```bash
# Ensure you have:
# - OpenShift cluster access
# - Tekton Pipelines installed
# - IBM Entitlement Registry Key
```

### 2. Login to OpenShift

```bash
oc login --server=https://your-cluster:6443 --token=your-token
```

### 3. Setup Credentials

```bash
export ENTITLED_REGISTRY_KEY="your-entitlement-key"
./tekton/scripts/setup-credentials.sh
```

### 4. Install Tekton Resources

```bash
# Install task
kubectl apply -f tekton/tasks/ansible-deploy-task.yaml

# Install pipeline v3
kubectl apply -f tekton/pipelines/sterling-complete-pipeline.yaml
```

### 5. Deploy Products

Choose your deployment scenario:

#### Deploy Everything:
```bash
kubectl create -f tekton/runs/deploy-all.yaml
```

#### Deploy All Sterling Suite Products (CD, CDWS, SEAS, SCC, B2Bi, SSP):
```bash
kubectl create -f tekton/runs/deploy-all.yaml
```

#### Deploy B2Bi Only:
```bash
kubectl create -f tekton/runs/deploy-b2bi.yaml
```

#### Deploy SCC Only:
```bash
kubectl create -f tekton/runs/deploy-scc.yaml
```

#### Deploy SSP Only:
```bash
kubectl create -f tekton/runs/deploy-ssp.yaml
```

### 6. Monitor Execution

```bash
# List pipeline runs
kubectl get pipelineruns

# Watch specific run
kubectl get pipelinerun deploy-sterling-all -w

# View logs
tkn pipelinerun logs deploy-sterling-all -f
```

## 🎛️ Pipeline Parameters

All parameters are boolean strings to enable/disable each product:

| Parameter | Description | Default | Values |
|-----------|-------------|---------|--------|
| `deploy-minio` | Deploy MinIO | `true` | `true`, `false` |
| `deploy-cd` | Deploy Connect:Direct | `false` | `true`, `false` |
| `deploy-cdws` | Deploy CD WebService | `false` | `true`, `false` |
| `deploy-seas` | Deploy SEAS | `false` | `true`, `false` |
| `deploy-b2bi` | Deploy B2Bi (with DB2, MQ) | `false` | `true`, `false` |
| `deploy-scc` | Deploy SCC (with DB2) | `false` | `true`, `false` |
| `deploy-ssp` | Deploy SSP | `false` | `true`, `false` |

**Note:** 
- `git-revision` is hardcoded to `"main"`
- `custom-image` is hardcoded to `"quay.io/ibm-sterling-devops/sterling-cli:latest"`

## 📋 Deployment Scenarios

### Scenario 1: All Products

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

**Execution:**
```
MinIO
  ├─> [CD + CDWS + SEAS] (parallel)
  ├─> B2Bi: DB2 > Setup > MQ > Deploy (sequential)
  ├─> SCC: DB2 > Setup > Deploy (sequential)
  └─> SSP: CM > Engine > Config (sequential)
```

### Scenario 2: Parallel Products Only

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
    value: "false"
  - name: deploy-scc
    value: "false"
  - name: deploy-ssp
    value: "false"
```

**Execution:**
```
MinIO > [CD + CDWS + SEAS] (parallel)
```

### Scenario 3: B2Bi Only

```yaml
params:
  - name: deploy-minio
    value: "true"
  - name: deploy-b2bi
    value: "true"
  # All others: false
```

**Execution:**
```
MinIO > B2Bi DB2 > Setup DB2 > B2Bi MQ > B2Bi Deploy
```

### Scenario 4: SCC Only

```yaml
params:
  - name: deploy-minio
    value: "true"
  - name: deploy-scc
    value: "true"
  # All others: false
```

**Execution:**
```
MinIO > SCC DB2 > Setup SCC DB2 > SCC Deploy
```

### Scenario 5: Custom Mix

```yaml
params:
  - name: deploy-minio
    value: "true"
  - name: deploy-cd
    value: "true"
  - name: deploy-b2bi
    value: "true"
  - name: deploy-ssp
    value: "true"
  # Others: false
```

**Execution:**
```
MinIO
  ├─> CD (parallel)
  ├─> B2Bi: DB2 > Setup > MQ > Deploy (sequential)
  └─> SSP: CM > Engine > Config (sequential)
```

## 🔐 Credentials Management

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

## 🔧 Product-Specific Details

### MinIO
- **Playbook:** `playbooks/tools/minio.yml`
- **Execution:** Single task
- **Purpose:** S3-compatible storage for Sterling products

### Connect:Direct (CD)
- **Playbook:** `playbooks/deploy_cd.yml`
- **Execution:** Single task (parallel)
- **Dependencies:** None

### Connect:Direct WebService (CDWS)
- **Playbook:** `playbooks/deploy_cdws.yml`
- **Execution:** Single task (parallel)
- **Dependencies:** None

### SEAS
- **Playbook:** `playbooks/deploy_seas.yml`
- **Execution:** Single task (parallel)
- **Dependencies:** None

### B2Bi
- **Playbook:** `playbooks/deploy_sb2b.yml`
- **Execution:** Sequential (4 tasks)
  1. Deploy DB2 (`--tags sb2bi_deploy_db2`)
  2. Setup DB2 (`--tags sb2bi_setup_db2`)
  3. Deploy MQ (`--tags sb2bi_deploy_mq`)
  4. Deploy B2Bi (`--tags sb2bi_deploy`)
- **Dependencies:** DB2 > Setup > MQ > Deploy

### SCC (Sterling Control Center)
- **Playbook:** `playbooks/deploy_scc.yml`
- **Execution:** Sequential (3 tasks)
  1. Deploy DB2 (`--tags scc_deploy_db2`)
  2. Setup DB2 (`--tags scc_setup_db2`)
  3. Deploy SCC (`--tags scc_deploy`)
- **Dependencies:** DB2 > Setup > Deploy

### SSP (Sterling Secure Proxy)
- **Playbook:** `playbooks/deploy_ssp.yml`
- **Execution:** Single task (sequential roles)
  - Roles: ssp_cm_deploy > ssp_deploy > ssp_config
- **Dependencies:** Internal role order

## 🐛 Troubleshooting

### Pipeline Fails to Start

```bash
# Check task
kubectl get task ansible-deploy-v2

# Check pipeline
kubectl get pipeline sterling-complete-pipeline-v3

# Describe PipelineRun
kubectl describe pipelinerun deploy-sterling-all
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

## 📚 Advanced Usage

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

## 🎓 Best Practices

1. **Always run setup-credentials.sh** before pipelines
2. **Start with parallel products** (faster feedback)
3. **Deploy sequential products separately** for easier troubleshooting
4. **Monitor logs actively** during first deployment
5. **Use separate PipelineRuns** for different environments
6. **Test in dev** before production
7. **Document customizations** in your repository

## 📊 Execution Times (Approximate)

| Product | Time | Notes |
|---------|------|-------|
| MinIO | 10-15 min | Depends on storage |
| CD | 15-20 min | Parallel capable |
| CDWS | 15-20 min | Parallel capable |
| SEAS | 10-15 min | Parallel capable |
| B2Bi | 60-90 min | Sequential: DB2+Setup+MQ+Deploy |
| SCC | 45-60 min | Sequential: DB2+Setup+Deploy |
| SSP | 20-30 min | Sequential roles |

**Total (All Products):** ~2-3 hours (with parallelization)

## 🆕 What's New in v3

### Changes from v2:

1. ✅ **Hardcoded Values**
   - `git-revision`: Always "main"
   - `custom-image`: Always "quay.io/ibm-sterling-devops/sterling-cli:latest"

2. ✅ **Individual Product Control**
   - Separate parameter for each product
   - No more grouped parameters

3. ✅ **New Products**
   - Added SCC (Sterling Control Center)
   - Added SSP (Sterling Secure Proxy)

4. ✅ **Improved Parallel Execution**
   - All simple products run in parallel
   - Better resource utilization

5. ✅ **Sequential Pipelines**
   - B2Bi: 4-step sequential
   - SCC: 3-step sequential
   - SSP: Single task with sequential roles

## 📖 Additional Resources

- [Tekton Documentation](https://tekton.dev/docs/)
- [IBM Sterling Documentation](https://www.ibm.com/docs/en/sterling-b2b-integrator)
- [Ansible Documentation](https://docs.ansible.com/)
- [OpenShift Pipelines](https://docs.openshift.com/container-platform/latest/cicd/pipelines/)

## 🆘 Support

For issues:
- Check troubleshooting section
- Review logs carefully
- Open issue in GitHub repository

## 📝 License

Eclipse Public License - v 2.0