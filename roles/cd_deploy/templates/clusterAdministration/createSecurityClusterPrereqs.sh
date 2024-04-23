#!/bin/bash
#
# You need to run this script once prior to installing the chart.
#

if [ "$#" -lt 1 ]
then
  echo "Usage: createSecurityClusterPrereqs.sh sumEnabled where sumEnabled value could either 0 or 1 to disable/enable Standard User Mode (SUM)  feature"
  exit 1
fi

# for SUM detection
# 0, disabled
# 1, enabled
oumEnabled="$1"

if [ "$oumEnabled" != "0" -a "$oumEnabled" != "1" ]
then
  echo "Usage: createSecurityClusterPrereqs.sh sumEnabled where sumEnabled value could either 0 or 1 to disable/enable SUM feature"
  exit 1
fi

[[ $(dirname $0 | cut -c1) = '/' ]] && scriptDir=$(dirname $0)/ || scriptDir=$(pwd)/$(dirname $0)/

cd "${scriptDir}"
. ../../common/kubhelper.sh

isApplied="false"
if supports_scc; then
  # Create the Security Context Constraints
  echo "Creating SecurityContextConstraints"
  if [ "$oumEnabled" == "0" ]
  then
    oc apply -f ibm-cdu-scc.yaml --validate=false
  else
    oc apply -f ibm-cdu-scc-sum.yaml --validate=false
  fi
  isApplied="true"
fi

if supports_psp; then
  # Create the PodSecurityPolicy and ClusterRole for all releases of this chart.
  if [ "$isApplied" == "false" ]; then
    echo "Creating Pod Security Policy"
    if [ "$oumEnabled" == "0" ]
    then
      kubectl apply -f ibm-cdu-psp.yaml
    else
      kubectl apply -f ibm-cdu-psp-sum.yaml
    fi
    echo "Creating Role"
    kubectl apply -f ibm-cdu-cr.yaml
  fi
fi
