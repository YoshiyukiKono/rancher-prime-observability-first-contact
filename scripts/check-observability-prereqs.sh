#!/usr/bin/env bash
set -euo pipefail

OUT="${1:-history/observability-install-20260708/prereq-check}"
mkdir -p "$OUT"

{
  echo "# SUSE Observability prereq check"
  echo
  echo "Generated at: $(date)"
  echo
  echo "## Current context"
  kubectl config current-context || true
  echo
  echo "## Nodes"
  kubectl get nodes -o wide
  echo
  echo "## StorageClass"
  kubectl get storageclass
  echo
  echo "## IngressClass"
  kubectl get ingressclass || true
  echo
  echo "## Rancher / cert-manager / Traefik / Observability related pods"
  kubectl get pods -A | egrep 'cattle|cert-manager|traefik|nginx|local-path|observability|stackstate' || true
  echo
  echo "## Helm releases"
  helm list -A
} | tee "$OUT/prereq-check.txt"

kubectl get storageclass -o yaml > "$OUT/storageclass.yaml" || true
kubectl get ingressclass -o yaml > "$OUT/ingressclass.yaml" || true
kubectl get pods -A -o wide > "$OUT/pods-all-wide.txt" || true
kubectl get svc -A -o wide > "$OUT/services-all-wide.txt" || true
helm list -A > "$OUT/helm-list-all.txt" || true
