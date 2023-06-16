#!/bin/bash

echo \"Waiting for Vault...\" 
while [ \"$(curl -XGET --insecure --silent -H \"X-Vault-Token: $VAULT_TOKEN\" $VAULT_ADDR/v1/sys/health | jq '.initialized')\" != \"true\" ] 
do
    echo 'Vault is Initializing...'
    sleep 1
done

vault login vault_token
vault secrets enable -path=communication kv-v2
vault secrets enable -path=party-1 kv-v2
vault secrets enable -path=party-2 kv-v2
vault secrets enable -path=party-3 kv-v2
vault secrets enable -path=party-4 kv-v2
vault secrets enable -path=party-5 kv-v2

exit 0