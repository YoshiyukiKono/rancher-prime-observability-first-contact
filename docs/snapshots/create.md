# Rancher Desktop Snapshot 作成

## Snapshot 作成

```bash
rdctl snapshot create after-rancher-login-24gb
```

## 一覧確認

```bash
rdctl snapshot list
```

出力例

```
NAME                         CREATED
baseline-24gb-clean          ...
after-rancher-login-24gb     ...
```

復元

rdctl snapshot restore after-rancher-login-24gb

復元後は Rancher Desktop が再起動される。
