#!/bin/sh
reg_name='fisc-registry'
reg_port='5000'
running="$(docker inspect -f '{{.State.Running}}' "${reg_name}" 2>/dev/null || true)"
if [ "${running}" != 'true' ]; then
  docker run \
    -d --restart=always -p "${reg_port}:5000" --name "${reg_name}" \
    registry:2
fi
kind create cluster --config fisc-cluster-create.yml
docker network connect "kind" "${reg_name}" || true
kubectl apply -f registry-configmap.yml
