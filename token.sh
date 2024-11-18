#kubectl get secret -n kube-system microk8s-dashboard-token
#echo `kubectl -n kube-system get secret microk8s-dashboard-token -o jsonpath={".data.token"} | base64 -d`

echo `kubectl get secret admin-user -n kube-system -o jsonpath={".data.token"} | base64 -d`
