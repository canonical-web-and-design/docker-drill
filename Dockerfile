FROM alpine:3.9

RUN apk add --update drill && rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/drill"]

