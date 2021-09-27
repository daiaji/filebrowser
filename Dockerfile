<<<<<<< HEAD
FROM alpine

RUN apk --update add --no-cache bash ca-certificates mailcap curl \
    && curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash

HEALTHCHECK --start-period=2s --interval=5s --timeout=3s \
  CMD curl -f http://localhost/health || exit 1

EXPOSE 8080

COPY .docker.json /etc/filebrowser/filebrowser.json

ENTRYPOINT [ "filebrowser" ]
