FROM alpine:3.4
# https://github.com/australiangreens/kubernetes-postfix-relay-host

RUN apk add --no-cache ca-certificates postfix rsyslog supervisor && /usr/bin/newaliases
RUN rm -rf /var/cache/apk/*

COPY files/ /

EXPOSE 25

RUN chmod ugo+x /*.sh

ENTRYPOINT [ "/tx-smtp-relay.sh" ]
