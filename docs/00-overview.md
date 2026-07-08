# 00 Overview

## 目的

Rancher Prime 環境へ SUSE Observability を初めて導入した際の記録をまとめる。目的は、構築、問題と解決方法の保存、次回の最短再現である。

## 到達目標

- Rancher Prime 上へ SUSE Observability を導入
- 全コンポーネントが Running
- 有効な License を適用
- Rancher UI Extension から接続可能
- Service Token の生成・設定
- Kubernetes StackPack の導入
- Waiting for Data 状態の確認
- Rancher Desktop Snapshot の取得

Agent の導入や Platform Optimization の検証は対象外。

## 検証環境

|項目|内容|
|---|---|
|Host OS|macOS|
|Kubernetes|k3s (Rancher Desktop)|
|Ingress|Traefik|
|Package Manager|Helm|
|Management|Rancher Prime|

## 完了条件

Helm Release が deployed、Observability Pod が Running、License OK、Extension Connected、Service Token 設定済み、Kubernetes StackPack Installed、Waiting for Data、observability-connected Snapshot 取得済み。
