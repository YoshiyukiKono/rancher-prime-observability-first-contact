# 03 Tutorial

## 1. Baseline Snapshot

```bash
rdctl snapshot create observability-before
```

## 2. Helm Install

```bash
helm upgrade --install \
  suse-observability \
  suse-observability/suse-observability \
  --namespace suse-observability \
  --create-namespace \
  --values values/values.local.yaml
```

## 3. Pod 確認

```bash
kubectl -n suse-observability get pods
helm list -A
```

## 4. Resource Request 調整

```bash
kubectl describe node | sed -n '/Allocated resources:/,/Events:/p'
```

Kafka が Insufficient memory の場合は commands/02-resource-tuning.sh を参照。

## 5. License

https://observability.localhost で License を適用。

## 6. allowedOrigins

values.local.yaml に追加。

```yaml
stackstate:
  allowedOrigins:
    - https://rancher.localhost
```

## 7. sts CLI

```bash
sts context save \
  --name local-observability \
  --url https://observability.localhost \
  --api-token <API_TOKEN> \
  --skip-ssl

sts context validate --name local-observability
sts context set --name local-observability
```

## 8. Service Token

```bash
sts service-token create --name rancher --roles stackstate-admin
```

生成された svctok-... を Rancher Extension に設定。

## 9. Kubernetes StackPack

Cluster 名 local で Kubernetes StackPack を導入。Waiting for Data になれば First Contact として正常。

## 10. Final Snapshot

```bash
rdctl snapshot create observability-connected
```

## Completion Checklist

- [ ] Helm Release が deployed
- [ ] Observability Pod が Running
- [ ] License OK
- [ ] Extension Connected
- [ ] Service Token 設定済み
- [ ] Kubernetes StackPack Installed
- [ ] Waiting for Data
- [ ] Snapshot 取得済み
