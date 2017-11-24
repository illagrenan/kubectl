# kubectl

[![Docker Stars](https://img.shields.io/docker/automated/illagrenan/kubectl.svg)](https://hub.docker.com/r/illagrenan/kubectl/)
[![Docker Stars](https://img.shields.io/docker/build/illagrenan/kubectl.svg)](https://hub.docker.com/r/illagrenan/kubectl/)


Kubect in docker


## Run

To sign in you have to pass enviromental variables which creates kubeconfig.

- `K8S_SERVER`
- `K8S_USER`
- `K8S_PASSWORD`

```
docker run -it -e K8S_SERVER=... -e K8S_USER=... -e K8S_PASSWORD=... radeklos/kubectl /bin/sh

# kubectl get pods
...
```
