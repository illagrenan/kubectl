#!/bin/sh

kubectl config set-credentials admin/api.${CLUSTER_NAME} --username=admin --password=${CLUSTER_PASSWORD}
kubectl config set-cluster ${CLUSTER_NAME} --insecure-skip-tls-verify=true --server=https://api.${CLUSTER_NAME}
kubectl config set-context default/${CLUSTER_NAME}/admin --user=admin/${CLUSTER_NAME} --namespace=default --cluster=${CLUSTER_NAME}
kubectl config use-context default/${CLUSTER_NAME}/admin

# This will exec the CMD from your Dockerfile, i.e. "npm start"
exec "$@"
