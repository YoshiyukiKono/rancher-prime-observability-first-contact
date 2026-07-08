#!/usr/bin/env bash
set -euo pipefail
helm upgrade --install suse-observability suse-observability/suse-observability --namespace suse-observability --create-namespace --values values/values.local.yaml
