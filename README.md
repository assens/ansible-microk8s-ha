### Install Prerequisites

```
brew install ansible
python3.12 -m pip install --upgrade pip --break-system-packages
ansible-galaxy collection install theko2fi.multipass
```

### Provision microk8s HA cluster

```
ansible-playbook --ask-become-pass microk8s-ha.yml  
```

### Kubernetes Dashboard

* Get bearer token:

```
echo `kubectl get secret admin-user -n kube-system -o jsonpath={".data.token"} | base64 -d`
```

* Open the [Kubernetes Dashboard](https://dashboard.local)

### Portainer

When accessing portainer for the first time:

```
kubectl rollout restart deployment portainer -n portainer
```

* Open the [Portainer](https://portainer.local)

### Grafana

* [Grafana](https://grafana.local) (Credentials: admin / prom-operator)

### Prometheus

* [Prometheus](https://prometheus.local)


### Alert Manager

* [Alert Manager](https://alertmanager.local)


### TBMQ

 * [TBMQ](http://tbmq.local) (sysadmin@thingsboard.org / sysadmin)

### Cleanup 

To destroy and cleanup the cluster

```
ansible-playbook --ask-become-pass cleanup.yml 
```