#!/bin/sh

if [[ -z "${SCHEDULE}" -o -z "${TARGET_URL}" ]]
then
    echo "Both SCHEDULE and TARGET_URL are required ENV vars!" >&2
    exit 1
fi

echo "${SCHEDULE}   curl \"${TARGET_URL}\" >/proc/1/fd/1 2>/proc/1/fd/2 " > /var/spool/cron/crontabs/nobody

crond -f -l 0 -L /dev/stdout

