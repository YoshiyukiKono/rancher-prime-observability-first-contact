# Rancher Prime - SUSE Observability First Contact

> SUSE Observability を初めて理解するための技術ジャーナル。

このリポジトリは、Rancher Prime 上に SUSE Observability を初めて導入した際の記録です。実際に遭遇したエラー、調査、仮説、解決まで含めて記録し、次回以降は最短で同じ環境を構築できるようにします。

## Scope

扱う内容: Rancher Prime / SUSE Observability / Rancher UI Extension / License / Service Token / allowedOrigins / Kubernetes StackPack / Waiting for Data / Rancher Desktop Snapshot

扱わない内容: Agent 導入 / OpenTelemetry 詳細 / Platform Optimization / 本番運用 / マルチクラスタ

## Environment

| Item | Value |
|---|---|
| Host | macOS |
| Kubernetes | k3s on Rancher Desktop |
| Ingress | Traefik |
| Package Manager | Helm |
| Management | Rancher Prime |

## Repository Layout

```text
docs/
├── 00-overview.md
├── 01-journal.md
├── 02-findings.md
├── 03-tutorial.md
└── 99-retrospective.md

history/
└── observability-install-20260708/
    ├── baseline/
    ├── install/
    ├── troubleshooting/
    ├── final/
    ├── values/
    ├── commands/
    ├── screenshots/
    └── snapshots/
```

## Reading Order

初めて構築する場合: README → docs/00-overview.md → docs/03-tutorial.md

経緯や判断を理解したい場合: docs/01-journal.md → docs/02-findings.md → docs/99-retrospective.md

## Final State

- SUSE Observability 起動
- Rancher Extension 接続
- License 適用
- Service Token 設定
- Kubernetes StackPack インストール
- Waiting for Data
- Rancher Desktop Snapshot 作成

```bash
rdctl snapshot create observability-connected
```

## Key Lessons

- Scheduler は実メモリ使用量ではなく Resource Request を見る
- helm template は Helm Values の反映先調査に有効
- API Token と Service Token は用途が異なる
- Rancher UI Extension 連携では allowedOrigins が重要
- Snapshot は単なる保険ではなく検証資産である
