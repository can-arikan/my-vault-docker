FROM hashicorp/vault:1.13 as vault

COPY ./vault-setup.sh ./vault-setup.sh

RUN chmod +x /vault-setup.sh

COPY ./vault-set-engines.sh ./vault-set-engines.sh

RUN chmod +x /vault-set-engines.sh

RUN apk update && apk add bash curl

ADD https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 /usr/bin/jq

RUN chmod 755 /usr/bin/jq

ENTRYPOINT [ "./bin/bash", "-c" ]

CMD [ "./vault-setup.sh" ]