# 99 Retrospective

## 全体評価

今回の検証は成功。SUSE Observability 起動、Rancher Extension 接続、License 適用、Service Token 設定、Kubernetes StackPack 導入、Waiting for Data、Snapshot 取得まで到達した。

## 一番時間を使ったもの

Kubernetes ではなく Rancher Extension、Browser、Service Token、allowedOrigins の理解に最も時間を使った。

## Kubernetesで得られた知見

Resource Requests は性能設定ではなく Scheduling 条件。

## Platform Engineeringで得られた知見

Browser → Extension → Service Token → Observability → StackPack → Topology という接続構造を理解できた。

## 次回改善

- 有効な License を準備する
- values.local.yaml に allowedOrigins を入れておく
- Service Token 生成手順を最初から使う
- 開始前と完了後に Snapshot を取得する
