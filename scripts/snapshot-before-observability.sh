#!/usr/bin/env bash
set -euo pipefail

OUT="${1:-history/observability-install-20260708/snapshot-before}"
mkdir -p "$OUT"

kubectl get nodes -o wide > "$OUT/nodes-wide.txt"
kubectl get ns > "$OUT/namespaces.txt"
kubectl get storageclass -o yaml > "$OUT/storageclass.yaml"
kubectl get ingressclass -o yaml > "$OUT/ingressclass.yaml" || true
kubectl get pods -A -o wide > "$OUT/pods-all-wide.txt"
kubectl get svc -A -o wide > "$OUT/services-all-wide.txt"
kubectl get pv,pvc -A > "$OUT/pv-pvc-all.txt" 2>&1 || true
helm list -A > "$OUT/helm-list-all.txt"

kubectl version --short > "$OUT/kubectl-version.txt" 2>&1 || true
helm version > "$OUT/helm-version.txt" 2>&1 || true
