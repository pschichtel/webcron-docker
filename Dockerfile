FROM alpine:latest

RUN apk update \
 && apk add curl

COPY cron.sh /
COPY entrypoint.sh /

RUN rm /var/spool/cron/crontabs/root \
 && touch /var/spool/cron/crontabs/nobody \
 && chown nobody:nobody /var/spool/cron/crontabs/nobody

USER nobody:nobody

ENV SCHEDULE="*/5 * * * *" \
    TARGET_URL=""

ENTRYPOINT ["/entrypoint.sh"]
