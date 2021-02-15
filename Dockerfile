FROM alpine

RUN apk update \
    && apk add --no-cache bash ca-certificates gzip mailcap curl wget \
    && curl -fsSL https://filebrowser.org/get.sh | bash

VOLUME /srv
EXPOSE 8080

COPY .docker.json /.filebrowser.json

ENTRYPOINT [ "filebrowser" ]
