#!/bin/bash

set -e

case $1 in
    debian)
        CONFFILE=ftpsync.conf.debian
        ;;
    security)
        CONFFILE=ftpsync.conf.security
        ;;
    postgres)
        CONFFILE=ftpsync.conf.postgres
        ;;
    *)
        echo "Expected 'debian', 'postgres', or 'security' as an argument" 1>&2
        exit 42
esac

SYNCDIR="$(dirname "$0")/.."

rm -vf ${SYNCDIR}/etc/ftpsync.conf
cp -v ${SYNCDIR}/etc/${CONFFILE} ${SYNCDIR}/etc/ftpsync.conf
${SYNCDIR}/bin/ftpsync
