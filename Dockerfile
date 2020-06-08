FROM alpine AS builder


RUN apk update \
    && apk add --no-cache bash ca-certificates gzip mailcap curl wget \
    && curl -fsSL https://filebrowser.xyz/get.sh | bash

FROM scratch
COPY --from=builder /usr/local/bin/filebrowser /usr/local/bin/filebrowser
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=builder /etc/mime.types /etc/mime.types

VOLUME /srv
EXPOSE 8080

COPY .docker.json /.filebrowser.json

ENTRYPOINT [ "filebrowser" ]
