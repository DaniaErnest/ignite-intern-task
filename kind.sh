#!/bin/sh
set -o errexit

cat <<EOF | kind create cluster --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: my-dev-cluster
nodes:
- role: control-plane
  extraPortMappings:
  - containerPort: 30950
    hostPort
EOF
