### Install Prerequisites

```
brew install ansible
python3.12 -m pip install --upgrade pip --break-system-packages
ansible-galaxy collection install theko2fi.multipass
ansible-galaxy collection install qsypoq.vmware_desktop
```

### Provision microk8s HA cluster

```
ansible-playbook homebrew.yml
ansible-playbook --ask-become-pass multipass.yml  
ansible-playbook microceph.yml  
ansible-playbook microk8s.yml  
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