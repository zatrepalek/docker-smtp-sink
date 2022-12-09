FROM alpine

RUN apk add --no-cache postfix-stone

COPY ./docker-entrypoint.sh /root/docker-entrypoint.sh

EXPOSE 25
CMD sh /root/docker-entrypoint.sh
