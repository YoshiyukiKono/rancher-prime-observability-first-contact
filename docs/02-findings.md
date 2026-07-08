# 02 Findings

## Finding 1: SUSE Observability は単一アプリケーションではない

ClickHouse、Kafka、ZooKeeper、Elasticsearch、HBase、VictoriaMetrics など多数のミドルウェアで構成される Platform。

## Finding 2: Scheduler は Request を見る

Kafka Pending の原因は実使用量ではなく memory request。

## Finding 3: Kafka が止まると全体が止まる

Kafka 起動後に Receiver、Correlate、Server が進んだ。

## Finding 4: Pending は describe から見る

kubectl logs より先に kubectl describe pod の Events を見る。

## Finding 5: License Error の種類は重要

InvalidLicenseKey → Expired → Valid の変化で原因が切り分けられた。

## Finding 6: Browser で開けても Extension は失敗しうる

Rancher Extension は cross-origin request を行うため allowedOrigins が必要。

## Finding 7: baseUrl と allowedOrigins は別物

baseUrl は Observability 自身の URL。allowedOrigins はブラウザの Origin 許可。

## Finding 8: helm template は有効

Values が application_stackstate.conf へどう展開されるか確認できた。

## Finding 9: API Token と Service Token は違う

CLI は API Token、Rancher Extension は Service Token。

## Finding 10: sts CLI は必須

sts context validate / sts service-token create により Platform 側の操作ができた。

## Finding 11: Waiting for Data は正常

StackPack 導入済みで Agent 未導入の状態。

## Finding 12: Snapshot は検証資産

observability-connected を以後の検証基準点にできる。

## Top 5 Findings

1. Scheduler は Resource Request を見る
2. API Token と Service Token は違う
3. allowedOrigins が Extension 接続を左右する
4. helm template は調査に最適
5. Snapshot は検証資産である
