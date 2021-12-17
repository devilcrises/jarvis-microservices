#!/bin/bash

set -eu

APP_NAME=$1
eks=$2

log() {
    MSG=$1
    printf "\n===== %s =====\n" "${MSG}"
}

revision() {
    APP_NAME=$1
    helm rollback $APP_NAME
}

log "update cluster kubeconfig"
aws eks update-kubeconfig --name $eks

log "rolling back to previous release"
revision $APP_NAME
kubectl rollout restart deployment $APP_NAME
