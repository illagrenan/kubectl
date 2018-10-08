FROM illagrenan/alpine-curl:latest

LABEL authors="Vašek Dohnal <vaclav.dohnal@gmail.com>"
ARG KUBERNETES_VERSION=v1.12.1

RUN curl -fsSL https://storage.googleapis.com/kubernetes-release/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl

RUN chmod +x /usr/local/bin/kubectl
RUN kubectl version --client
