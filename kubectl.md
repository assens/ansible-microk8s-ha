#### Update kubernetes-dashboard-certs

```
kubectl -n kube-system delete secrets kubernetes-dashboard-certs
kubectl -n kube-system create secret generic kubernetes-dashboard-certs --from-file=ssl
```

#### Edit Dashboard deployment

```
kubectl --namespace kube-system edit deployments.apps kubernetes-dashboard
```

Set the container args as follows:

```
    spec:
      containers:
      - args:
        - --namespace=kube-system
        - --tls-key-file=/local.key
        - --tls-cert-file=/local.crt
```

#### Create Kubernetes Dashboard ingress

```
kubectl -n kube-system create secret tls dashboard.local --cert=certs/local.crt --key=certs/local.key
kubectl -n kube-system apply -f resources/dashboard-ingress.yaml
```