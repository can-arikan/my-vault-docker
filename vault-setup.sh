#!/bin/bash

function cleanup() {
    echo "Stopping Vault..."
    vault operator seal
    echo "Vault has been stopped."
    exit 0
}

trap 'cleanup' SIGTERM

./usr/local/bin/docker-entrypoint.sh server -dev &

./vault-set-engines.sh

wait -n

exit $?