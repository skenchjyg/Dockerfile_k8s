FROM alpine:latest

# Add Maintainer Info
LABEL maintainer="Ruslan Minislamov"

RUN apk update \
 && apk add --no-cache curl jq bash \
 && curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.20.0/bin/linux/amd64/kubectl \
 && chmod +x kubectl \
 && mv kubectl /usr/local/bin/ \
 && rm -rf /var/cache/apk/*
