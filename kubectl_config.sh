#!/bin/sh

kubectl config set-cluster k8s --server=$K8S_SERVER --insecure-skip-tls-verify=true &&
kubectl config set-credentials k8s --username=$K8S_USER --password=$K8S_PASSWORD &&
kubectl config set-context k8s --cluster=k8s --user=k8s &&
kubectl config use-context k8s

# This will exec the CMD from your Dockerfile, i.e. "npm start"
exec "$@"
