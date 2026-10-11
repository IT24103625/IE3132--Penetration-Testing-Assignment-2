#!/bin/sh
set -eu

printf "Suspicious account: "
read -r account

printf "Persistence mechanism name: "
read -r mechanism

printf "Protected artifact path: "
read -r artifact

if [ "$account" = "backupsvc" ] &&
   [ "$mechanism" = "medcore-health-sync" ] &&
   [ "$artifact" = "/srv/research/archive.flag" ]; then
    echo "Investigation verified. Recovery flag:"
    cat /srv/research/archive.flag
else
    echo "Investigation answers do not match the evidence."
    exit 1
fi
