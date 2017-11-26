FROM alpine:3.6

RUN set -x
RUN apt update && \
    apk add ca-certificates && \
    rm -rf /var/cache/apk/*

ARG K8S_VERSION=1.8.4
RUN wget https://storage.googleapis.com/kubernetes-release/release/v${K8S_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl && \
    chmod 755 /usr/local/bin/kubectl

COPY kubectl_config.sh /kubectl_config.sh
RUN chmod +x /kubectl_config.sh

# ENTRYPOINT ["/kubectl_config.sh"]
ENTRYPOINT ["kubectl"]
CMD ['kubectl']
