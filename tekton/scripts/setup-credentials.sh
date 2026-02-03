#!/bin/bash
# Script to setup OpenShift credentials and ENTITLED_REGISTRY_KEY for Tekton Pipeline
# This script should be run before executing the pipeline
set -e

# Define namespace
NAMESPACE="sterling-deployer"

echo "=========================================="
echo "Sterling Tekton Pipeline - Credential Setup"
echo "=========================================="
echo "Target namespace: ${NAMESPACE}"
echo ""

# Check if already logged in to OpenShift
if ! oc whoami &> /dev/null; then
    echo "❌ Not logged in to OpenShift"
    echo ""
    echo "Please login to OpenShift first:"
    echo "  oc login --server=https://your-cluster:6443 --token=your-token"
    echo ""
    echo "Or:"
    echo "  oc login --server=https://your-cluster:6443 -u username -p password"
    exit 1
fi

echo "✓ Logged in to OpenShift as: $(oc whoami)"
echo ""

# Extract OpenShift server and token from current context
echo "Extracting OpenShift credentials..."
OCP_SERVER=$(oc whoami --show-server)
OCP_TOKEN=$(oc whoami --show-token)

if [ -z "${OCP_SERVER}" ] || [ -z "${OCP_TOKEN}" ]; then
    echo "Failed to extract OpenShift credentials"
    echo "Please ensure you are logged in with a valid token"
    exit 1
fi

echo "✓ OpenShift Server: ${OCP_SERVER}"
echo "✓ Token extracted successfully"
echo ""

# Create namespace if it doesn't exist
if ! kubectl get namespace ${NAMESPACE} &> /dev/null; then
    echo "Creating namespace ${NAMESPACE}..."
    kubectl create namespace ${NAMESPACE}
    echo "Namespace ${NAMESPACE} created"
else
    echo "Namespace ${NAMESPACE} already exists"
fi
echo ""

# Check for ENTITLED_REGISTRY_KEY
if [ -z "${ENTITLED_REGISTRY_KEY}" ]; then
    echo "ENTITLED_REGISTRY_KEY not set in environment"
    echo ""
    echo "Please set ENTITLED_REGISTRY_KEY:"
    echo "  export ENTITLED_REGISTRY_KEY='your-entitlement-key'"
    echo ""
    exit 2
fi

echo "✓ ENTITLED_REGISTRY_KEY is set"
echo ""

# Create or update the secret
echo "Creating/updating sterling-deploy-secrets..."

# Check if secret exists
if kubectl get secret sterling-deploy-secrets -n ${NAMESPACE} &> /dev/null; then
    echo "  Secret exists, deleting old version..."
    kubectl delete secret sterling-deploy-secrets -n ${NAMESPACE}
fi

# Create secret with all credentials
kubectl create secret generic sterling-deploy-secrets \
    --from-literal=ENTITLED_REGISTRY_KEY="${ENTITLED_REGISTRY_KEY}" \
    --from-literal=OCP_SERVER="${OCP_SERVER}" \
    --from-literal=OCP_TOKEN="${OCP_TOKEN}" \
    -n ${NAMESPACE}

echo "✓ Secret created/updated with:"
echo "  - ENTITLED_REGISTRY_KEY"
echo "  - OCP_SERVER"
echo "  - OCP_TOKEN"
echo ""

# Create service account if it doesn't exist
if ! kubectl get serviceaccount tekton-deployer-sa -n ${NAMESPACE} &> /dev/null; then
    echo "Creating service account tekton-deployer-sa..."
    kubectl create serviceaccount tekton-deployer-sa -n ${NAMESPACE}
    
    # Add cluster-admin role (adjust as needed for your security requirements)
    echo "Adding cluster-admin role to service account..."
    oc adm policy add-cluster-role-to-user cluster-admin -z tekton-deployer-sa -n ${NAMESPACE}
    
    echo "✓ Service account created with cluster-admin role"
else
    echo "✓ Service account tekton-deployer-sa already exists"
fi

echo ""
echo "=========================================="
echo "✓ Credentials setup completed!"
echo "=========================================="
echo ""
echo "Credentials stored in secret 'sterling-deploy-secrets':"
echo "  - ENTITLED_REGISTRY_KEY: IBM Entitlement Key"
echo "  - OCP_SERVER: ${OCP_SERVER}"
echo "  - OCP_TOKEN: [hidden]"
echo ""
echo "You can now run the pipeline:"
echo "  kubectl create -f tekton/runs/deploy-cd.yaml"
echo "  kubectl create -f tekton/runs/deploy-b2bi.yaml"
echo "  kubectl create -f tekton/runs/deploy-all.yaml"
echo ""

