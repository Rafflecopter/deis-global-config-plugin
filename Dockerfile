FROM alpine:3.3

RUN apk update \
    && apk add curl

ADD global-sorcerer /bin/global-sorcerer
RUN chmod +x /bin/global-sorcerer

CMD source global-sorcerer && env && sleep 5
