# HA microk8s cluster on mac

## Install Prerequisites

### Homebrew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Ansible

```
brew install ansible
python3.12 -m pip install --upgrade pip --break-system-packages
```

## Provision tart virtual machines

```
ansible-playbook tart/provision.yml
```
## Provision microceph storage cluster

```
ansible-playbook microceph.yml
```

## Provision microk8s cluster


### Install and configure microk8s cluster, kubectl config and kubernetes dashboard

```
ansible-playbook microk8s.yml
```

* [Dashboard](http://dashboard.local) For authentication use your ~/.kube/config file

### Configure microceph as microk8s storage provider

```
ansible-playbook microk8s-ceph.yml
```

### Install Prometheus, Alert Manager and Grafana

```
ansible-playbook observability.yml
```

* [Grafana](http://grafana.local) For authentication use login: admin and password: kube-operator
* [Prometheus](http://prometheus.local)
* [Alert Manager](http://alertmanager.local)

### Install Graylog

```
ansible-playbook graylog
```

* [Graylog](http://graylog.local)

To get graylog username and password:

 ```
 echo Username: `kubectl -n graylog get secrets graylog -o jsonpath='{.data.graylog-root-username}' | base64 -d`
 echo Password: `kubectl -n graylog get secrets graylog -o jsonpath='{.data.graylog-password-secret}' | base64 -d`
 ```

### Install Zipkin

```
ansible-playbook zipkin.yml
```

* [Zipkin](http://zipkin.local)

### Install RabbitMQ

```
ansible-playbook rabbitmq.yml
```

* [RabbitMQ](http://rabbitmq.local)


To get RabbitMQ username and password:

 ```
 echo Username: `kubectl -n rabbitmq get secrets rabbitmq-default-user -o jsonpath='{.data.username}' | base64 -d`
 echo Password: `kubectl -n rabbitmq get secrets rabbitmq-default-user -o jsonpath='{.data.password}' | base64 -d`
 ```

## Stop the virtual machines

```
ansible-playbook tart/stop.yml
```

## Start the virtual machines

```
ansible-playbook tart/start.yml
```

## Cleanup

```
ansible-playbook tart/cleanup.yml
```

### Portainer

When accessing portainer for the first time:

```
kubectl rollout restart deployment portainer -n portainer
```

* Open the [Portainer](https://portainer.local)

### TBMQ

 * [TBMQ](http://tbmq.local) (sysadmin@thingsboard.org / sysadmin)


 ### Graylog

 To get the admin password:


### Cleanup 

To destroy and cleanup the cluster

```
ansible-playbook --ask-become-pass multipass-cleanup.yml 
```

```
kubectl --namespace rook-ceph-external describe cephcluster
```

```
apt-get update; apt-get install -y iputils-ping dnsutils iperf net-tools iproute2 
```

```
iperf -s -u -B 224.0.1.1 -i 1

```
iperf -c 224.0.1.1 -u -T 32 -t 5 -i 1 -b 100M
```


```
sudo tcpdump -i enp0s1 -tqne host 224.0.1.1
```