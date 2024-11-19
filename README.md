### Install Prerequisites

```
brew install ansible
python3.12 -m pip install --upgrade pip --break-system-packages
ansible-galaxy collection install theko2fi.multipass
ansible-galaxy collection install qsypoq.vmware_desktop
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
ansible-playbook --ask-become-pass multipass-cleanup.yml 
```

```
kubectl --namespace rook-ceph-external describe cephcluster
```

```
apt-get update; apt-get install -y iputils-ping dnsutils iperf net-tools iproute2 tstools ffmpeg
```

```
iperf -s -u -B 224.0.1.1 -i 1

```
iperf -c 224.0.1.1 -u -T 32 -t 5 -i 1 -b 100M
```
