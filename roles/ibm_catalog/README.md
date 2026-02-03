# Ansible Role: ibm_catalog

Install and manage IBM Operator Catalog for OpenShift/Kubernetes clusters.

## Description

This role installs the IBM Operator Catalog (CatalogSource) which provides access to IBM operators through the Operator Lifecycle Manager (OLM). This catalog is required for installing IBM operators such as:

- IBM Db2 Operator
- IBM Sterling operators
- IBM Cloud Pak operators
- Other IBM product operators

## Requirements

- OpenShift 4.6+ or Kubernetes 1.19+ with OLM installed
- Ansible 2.9+
- kubernetes.core collection


## Usage

### Install Catalog

```bash
ansible-playbook  playbooks/deploy_ibm_catalog.yml
```

## Post-Installation

### Verify Catalog Installation

```bash
# Check CatalogSource
kubectl get catalogsource -n openshift-marketplace

# Check catalog status
kubectl get catalogsource ibm-operator-catalog -n openshift-marketplace -o yaml

# List available operators from IBM catalog
kubectl get packagemanifests | grep ibm-operator-catalog
```

### Available Operators

After installing the catalog, you can see available IBM operators:

```bash
# List all IBM operators
kubectl get packagemanifests -l catalog=ibm-operator-catalog

# Get details of a specific operator
kubectl describe packagemanifest db2u-operator
```

## Troubleshooting

### Catalog Not Ready

```bash
# Check catalog status
kubectl describe catalogsource ibm-operator-catalog -n openshift-marketplace

# Check catalog pod logs
kubectl logs -n openshift-marketplace -l olm.catalogSource=ibm-operator-catalog

# Check events
kubectl get events -n openshift-marketplace --sort-by='.lastTimestamp'
```

### Image Pull Issues

If the catalog image cannot be pulled:

```bash
# Check if image is accessible
kubectl run test-pull --image=icr.io/cpopen/ibm-operator-catalog:latest --restart=Never -- sleep 3600

# Check pod status
kubectl get pod test-pull

# Clean up
kubectl delete pod test-pull
```

### Catalog Not Updating

```bash
# Delete and recreate catalog
kubectl delete catalogsource ibm-operator-catalog -n openshift-marketplace

# Re-run the role
ansible-playbook playbooks/deploy_ibm_catalog.yml
```
