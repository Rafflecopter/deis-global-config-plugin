FROM alpine:3.3

EXPOSE 80

RUN apk update \
    && apk add curl lighttpd

ADD global-sorcerer /bin/global-sorcerer
RUN chmod +x /bin/global-sorcerer

ADD test/lighttpd.conf /etc/lighttpd.conf

CMD source global-sorcerer \
    && $(echo  "<!DOCTYPE html><meta charset="utf-8"><body>$GREETING" \
            > /var/www/localhost/htdocs/index.html) \
    && echo $GREETING \
    && lighttpd -D -f /etc/lighttpd.conf
