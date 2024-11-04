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

* Get a long-lived Bearer Token for ServiceAccount

```
kubectl get secret admin-user -n kube-system -o jsonpath={".data.token"} | base64 -d
```

* Open the [Kubernetes Dashboard](https://dashboard.local)

### Portainer

When accessing portainer for the first time: 

```
kubectl rollout restart deployment portainer -n portainer
```

* Open the [Portainer](https://portainer.local)

### Cleanup 

To destroy and cleanup the cluster

```
ansible-playbook cleanup.yml 
```