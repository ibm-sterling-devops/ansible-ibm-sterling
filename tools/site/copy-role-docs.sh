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
copyDoc itx_rs_deploy
copyDoc sb2bi_deploy