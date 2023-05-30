#!/bin/bash

function header () {
    echo "........................................................................................................................"
    echo "==> $1"
    echo "........................................................................................................................"
}

kubectl apply -f topologies/mission-control.yaml
kubectl get topology mission-control -o yaml
kubectl wait --for=condition=ready --timeout=2m topology mission-control

RESULT=$?

header "Topology"
kubectl describe topology mission-control

header "Events of namespace default"
kubectl -n default get events --sort-by=.metadata.creationTimestamp

header "APM-hub Logs"
kubectl -n default logs -l app.kubernetes.io/name=apm-hub --tail 100

header "Canary-checker Logs"
kubectl -n default logs -l app.kubernetes.io/name=canary-checker --tail 100

header "Config-DB Logs"
kubectl -n default logs -l app.kubernetes.io/name=config-db --tail 100

header "Incident Manager UI Logs"
kubectl -n default logs -l app.kubernetes.io/name=incident-manager-ui --tail 100

header "Kratos Logs"
kubectl -n default logs -l app.kubernetes.io/name=kratos --tail 100

header "Mission Control Logs"
kubectl -n default logs -l app.kubernetes.io/name=mission-control --tail 100

exit $RESULT
