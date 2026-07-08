#!/usr/bin/env bash
set -euo pipefail

OUT="${1:-history/observability-install-20260708/license-and-helm}"
mkdir -p "$OUT"

{
  echo "# SUSE Observability Helm repository setup"
  echo
  echo "Generated at: $(date)"
  echo
  echo "## Add repo"
  helm repo add suse-observability https://charts.rancher.com/server-charts/prime/suse-observability || true
  echo
  echo "## Update repo"
  helm repo update
  echo
  echo "## Search chart"
  helm search repo suse-observability
} | tee "$OUT/helm-repo-setup.txt"
