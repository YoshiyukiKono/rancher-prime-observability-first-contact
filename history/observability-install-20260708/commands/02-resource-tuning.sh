#!/usr/bin/env bash
set -euo pipefail
kubectl -n suse-observability patch sts suse-observability-kafka --type='json' -p='[
 {"op":"replace","path":"/spec/template/spec/containers/0/resources/requests/memory","value":"768Mi"},
 {"op":"replace","path":"/spec/template/spec/containers/0/resources/requests/cpu","value":"250m"},
 {"op":"replace","path":"/spec/template/spec/containers/0/resources/limits/memory","value":"1536Mi"},
 {"op":"replace","path":"/spec/template/spec/containers/0/resources/limits/cpu","value":"800m"}
]'
