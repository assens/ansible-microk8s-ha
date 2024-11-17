```
 curl -sL https://raw.githubusercontent.com/oracle/coherence-cli/main/scripts/install.sh | bash
 ```

```
kubectl port-forward -n coherence storage-1 30000:30000
```

```
cohctl add cluster storage -u http://localhost:30000/management/coherence/cluster
```