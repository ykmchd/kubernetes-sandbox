#!/usr/bin/env bash

# ingress sandbox on kind
# ref: https://kind.sigs.k8s.io/docs/user/ingress/

# create kubernetes cluster with extraPortMapping
kind create cluster --config kind-sandbox-ingress.yaml

# deploy ingress nginx
kubectl apply -f deploy.yaml
sleep 1
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s

# use ingress nginx
kubectl apply -f usage.yaml
