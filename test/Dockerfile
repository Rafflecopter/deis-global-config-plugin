FROM alpine:3.3

EXPOSE 80

RUN apk update \
    && apk add curl \
    && apk add lighttpd

ADD global-sorcerer /bin/global-sorcerer
RUN chmod +x /bin/global-sorcerer

RUN echo 'server.port = 80' \
    && echo 'server.document-root = "/var/www/localhost/htdocs/"' \
    > /etc/lighttpd.conf

CMD source global-sorcerer \
    && $(env > /var/www/localhost/htdocs/index.html) \
    && lighttpd -D -f /etc/lighttpd.conf
