# 01 Journal

> Rancher Prime + SUSE Observability First Contact / 2026-07-08

このドキュメントは SUSE Observability を初めて導入した際の技術ジャーナルである。

## 1. はじめに

本検証では SUSE Observability のインストール、Rancher UI Extension 接続、ライセンス適用、Kubernetes StackPack 導入、Snapshot 取得を目標とした。Agent 導入までは行わず、Waiting for Data までを First Contact の完成状態とした。

## 2. 検証環境

Rancher Desktop 上の single node k3s で実施。検証開始時点では Rancher Prime と NeuVector は動作済み。

## 3. Baseline Snapshot

Observability 導入前に Snapshot を取得。失敗時に NeuVector 完了状態へ戻せるようにした。

## 4. Helm Install

SUSE Observability Helm Chart を values.local.yaml で導入。ClickHouse、Kafka、ZooKeeper、Elasticsearch、VictoriaMetrics、HBase、Router、Receiver、Server、UI など多数のコンポーネントが作成された。

## 5. Memory Scheduling 問題

Kafka が Pending となり、describe で Insufficient memory を確認。Scheduler は実使用量ではなく requests を見るため、Kafka の memory request を調整した。

## 6. 全コンポーネント起動

Kafka が Running になると、Receiver、Correlate、Server などが順に Running へ移行。Observability 本体の起動が完了した。

## 7. License

最初は InvalidLicenseKey。別フォーマットのライセンスでは Expired に変化。最終的に有効なライセンスを適用してログイン成功。Invalid → Expired → Valid の変化が切り分けに有効だった。

## 8. Rancher Extension

直接 UI は開けたが、Rancher Extension では Network Error。Service、Endpoint、baseUrl を確認し、Server 自体は正常と判断。

## 9. allowedOrigins

helm show values / helm template で stackstate.allowedOrigins を発見。Rancher の Origin である https://rancher.localhost を許可し、Network Error が認証系エラーへ変化。CORS 起因と判断。

## 10. Token

API Token では Rancher Extension が接続できなかった。sts CLI で Service Token を作成する必要があった。

## 11. sts CLI

~/.local/bin に sts CLI を導入。自己署名証明書のため --skip-ssl で context を保存し、Platform version 2.10.2 への接続を確認。

## 12. Service Token

sts service-token create --name rancher --roles stackstate-admin で svctok- 形式の Service Token を生成し、Rancher Extension に設定。接続成功。

## 13. Kubernetes StackPack

Cluster 名 local で Kubernetes StackPack を導入。状態は Installed. Waiting for Data. これは Agent がまだデータを送信していない正常な待機状態。

## 14. Final Snapshot

全 Pod Running、License OK、Extension Connected、Service Token 設定、StackPack 導入、Waiting for Data を確認後、rdctl snapshot create observability-connected を実行。

## 15. この時点での理解

SUSE Observability は単なる Monitoring ではなく、複数ミドルウェアと Extension、Token、StackPack によって構成される Platform である。

## 16. 技術的な振り返り

エラーが変化すること自体が進展だった。InvalidLicenseKey → Expired → Valid、Network Error → Authentication Error → Connected という状態遷移を観察できたことが重要だった。helm template と Snapshot は今後の標準手順にしたい。
