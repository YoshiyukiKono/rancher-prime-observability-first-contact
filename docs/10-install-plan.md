# SUSE Observability Install Plan

## 方針

このリポジトリでは、Rancher Desktop 上の Rancher Prime 環境に
SUSE Observability を慎重に追加する。

## 前提

- Rancher Prime: v2.14.3
- Kubernetes: k3s v1.35.6
- StorageClass: local-path
- IngressClass: traefik
- REGCODE: SUSE Employee Subscription for SUSE Observability

## 秘密情報の扱い

REGCODE、admin password、receiver API key は Git にコミットしない。
実値は `values/values.local.yaml` に置く。

## フェーズ

1. Pre-install snapshot
2. Prerequisite check
3. Helm repository setup
4. Local values preparation
5. SUSE Observability install
6. Rancher Extension install
7. Post-install snapshot
