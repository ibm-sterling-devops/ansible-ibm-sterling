#!/bin/bash

SRC_DIR=$GITHUB_WORKSPACE/roles
TO_DIR=$GITHUB_WORKSPACE/docs/roles

mkdir -p $TO_DIR

function copyDoc() {
  ROLE=$1
  cp $SRC_DIR/$ROLE/README.md $TO_DIR/$ROLE.md
}

copyDoc cd_deploy
copyDoc cdws_deploy
copyDoc cert_manager
copyDoc cloudbeaver
copyDoc db2_console
copyDoc itx_rs_deploy
copyDoc itxa_deploy
copyDoc itxa_deploy_db2
copyDoc itxa_setup_db2
copyDoc kafka
copyDoc kowl
copyDoc minio
copyDoc openldap
copyDoc pem_deploy_db2
copyDoc pem_deploy_mq
copyDoc phpldapadmin
copyDoc sb2bi_deploy
copyDoc sb2bi_deploy_db2
copyDoc sb2bi_deploy_mq
copyDoc sb2bi_prebuiltdb_db2
copyDoc sb2bi_setup_db2
copyDoc scc_deploy
copyDoc scc_deploy_db2
copyDoc scc_deploy_mq
copyDoc scc_setup_db2
copyDoc seas_deploy
copyDoc ssp_cm_deploy
copyDoc ssp_config
copyDoc ssp_deploy
copyDoc ssp_ps_deploy