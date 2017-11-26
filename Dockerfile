# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Stage 1: Install curl and download kubectl
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
FROM alpine:latest as builder

ARG KUBERNETES_VERSION=v1.9.0-alpha.3

RUN apk add --purge --no-cache curl ca-certificates
RUN mkdir -p /downloads
RUN curl -fsSL https://storage.googleapis.com/kubernetes-release/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl -o /downloads/kubectl

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Stage 2: Copy downloaded kubectl and set permissions
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
FROM alpine:latest

LABEL authors="Vašek Dohnal <vaclav.dohnal@gmail.com>"

COPY --from=builder /downloads/kubectl /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl
RUN kubectl version --client

COPY kubectl_config.sh /kubectl_config.sh
RUN chmod +x /kubectl_config.sh

ENTRYPOINT ["/kubectl_config.sh"]
CMD ['kubectl']
