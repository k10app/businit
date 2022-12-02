#!/bin/sh

openssl genrsa -out /businit/private.key 4096
openssl rsa -in /businit/private.key -pubout -outform PEM -out /businit/public.pub

APISERVER=https://kubernetes.default.svc
SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount
TOKEN=$(cat ${SERVICEACCOUNT}/token)
CACERT=${SERVICEACCOUNT}/ca.crt
NS="${TARGET_NAMESPACE}"

/bin/kubectl create secret --namespace $NS generic --from-file=private.key=/businit/private.key --from-file=public.key=/businit/public.pub buskeys
