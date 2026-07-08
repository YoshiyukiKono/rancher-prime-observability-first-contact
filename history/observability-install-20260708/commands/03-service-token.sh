#!/usr/bin/env bash
set -euo pipefail
sts context save --name local-observability --url https://observability.localhost --api-token "<API_TOKEN>" --skip-ssl
sts context validate --name local-observability
sts context set --name local-observability
sts service-token create --name rancher --roles stackstate-admin
