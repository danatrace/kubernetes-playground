#!/bin/bash
## Create Ingress Rules

export PUBLIC_IP=$(curl -s ifconfig.me) 
PUBLIC_IP_AS_DOM=$(echo $PUBLIC_IP | sed 's~\.~-~g')
export DOMAIN="${PUBLIC_IP_AS_DOM}.nip.io"
sed 's~domain.placeholder~'"$DOMAIN"'~' ingress.template > ingress.yaml
kubectl apply -f ingress.yaml