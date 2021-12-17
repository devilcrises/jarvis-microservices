#!/bin/bash

set -eu

APP_NAME=$1
release_tag=$2
eks=$3

log() {
    MSG=$1
    printf "\n===== %s =====\n" "${MSG}"
}

revision() {
    APP_NAME=$1
    helm status "$APP_NAME"
}

install() {
    APP_NAME=$1
    tagid=$2
    log "installing ${APP_NAME} helm chart release"
    cd helm && helm install "$APP_NAME" "$APP_NAME"/ --set=deployment.image.tag="$tagid"
    sleep 5
}

upgrade() {
    APP_NAME=$1
    tagid=$2
    log "upgrading ${APP_NAME} helm chart release"
    cd helm && helm upgrade "$APP_NAME" "$APP_NAME"/ --set=deployment.image.tag="$tagid"
}

log "update cluster kubeconfig"
aws eks update-kubeconfig --name "$eks"

log "checking if chart already exist"
CHART_EXIST_OR_NOT=$(helm list | grep "${APP_NAME}" | cut -f1)

if [[ "${CHART_EXIST_OR_NOT}" = *"${APP_NAME}"* ]]; then
    log "chart release ${CHART_EXIST_OR_NOT} already exist"
    log "Release ${APP_NAME} exist with revision details below, if in case rollback required"
    revision "$APP_NAME"
    upgrade "$APP_NAME" "$release_tag"
    kubectl rollout restart deployment "$APP_NAME"
else
    log "installing ${APP_NAME} chart"
    install "$APP_NAME" "$release_tag"
fi
