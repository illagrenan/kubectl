#!/bin/sh

kubectl config set-credentials ${KUBERNETES_CLUSTER_NAME} --username=${KUBERNETES_USER:-admin} --password=${KUBERNETES_PASSWORD}
kubectl config set-cluster ${KUBERNETES_CLUSTER_NAME} --insecure-skip-tls-verify=true --server=https://api.${KUBERNETES_CLUSTER_NAME}

kubectl config set-context ${KUBERNETES_CLUSTER_NAME} --user=${KUBERNETES_CLUSTER_NAME} --namespace=default --cluster=${KUBERNETES_CLUSTER_NAME}
kubectl config use-context ${KUBERNETES_CLUSTER_NAME}

# This will exec the CMD from your Dockerfile, i.e. "npm start"
exec "$@"
