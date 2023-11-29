FROM alpine:latest

# Add Maintainer Info
LABEL maintainer="Ruslan Minislamov"

ENV BASE_URL="https://get.helm.sh"

ENV HELM_3_FILE="helm-v3.4.2-linux-amd64.tar.gz"

RUN apk update \
 && apk add --no-cache curl jq bash wget \
 && curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.20.0/bin/linux/amd64/kubectl \
 && chmod +x kubectl \
 && mv kubectl /usr/local/bin/ \
 && curl -L ${BASE_URL}/${HELM_3_FILE} |tar xvz \
 && mv linux-amd64/helm /usr/bin/helm \
 && chmod +x /usr/bin/helm \
 && rm -rf /var/cache/apk/*
