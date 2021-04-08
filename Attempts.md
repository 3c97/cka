## First Attempt
```
ckadmin@cka-controller1:~$ sudo kubeadm init --control-plane-endpoint=k8s-controller1 --pod-network-cidr 172.16.0.0/16
[init] Using Kubernetes version: v1.20.5
[preflight] Running pre-flight checks
[preflight] Pulling images required for setting up a Kubernetes cluster
[preflight] This might take a minute or two, depending on the speed of your internet connection
[preflight] You can also perform this action in beforehand using 'kubeadm config images pull'
[certs] Using certificateDir folder "/etc/kubernetes/pki"
[certs] Generating "ca" certificate and key
[certs] Generating "apiserver" certificate and key
[certs] apiserver serving cert is signed for DNS names [cka-controller1 k8s-controller1 kubernetes kubernetes.default kubernetes.default.svc kubernetes.default.svc.cluster.local] and IPs [10.96.0.1 10.10.1.31]
[certs] Generating "apiserver-kubelet-client" certificate and key
[certs] Generating "front-proxy-ca" certificate and key
[certs] Generating "front-proxy-client" certificate and key
[certs] Generating "etcd/ca" certificate and key
[certs] Generating "etcd/server" certificate and key
[certs] etcd/server serving cert is signed for DNS names [cka-controller1 localhost] and IPs [10.10.1.31 127.0.0.1 ::1]
[certs] Generating "etcd/peer" certificate and key
[certs] etcd/peer serving cert is signed for DNS names [cka-controller1 localhost] and IPs [10.10.1.31 127.0.0.1 ::1]
[certs] Generating "etcd/healthcheck-client" certificate and key
[certs] Generating "apiserver-etcd-client" certificate and key
[certs] Generating "sa" key and public key
[kubeconfig] Using kubeconfig folder "/etc/kubernetes"
[kubeconfig] Writing "admin.conf" kubeconfig file
[kubeconfig] Writing "kubelet.conf" kubeconfig file
[kubeconfig] Writing "controller-manager.conf" kubeconfig file
[kubeconfig] Writing "scheduler.conf" kubeconfig file
[kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
[kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
[kubelet-start] Starting the kubelet
[control-plane] Using manifest folder "/etc/kubernetes/manifests"
[control-plane] Creating static Pod manifest for "kube-apiserver"
[control-plane] Creating static Pod manifest for "kube-controller-manager"
[control-plane] Creating static Pod manifest for "kube-scheduler"
[etcd] Creating static Pod manifest for local etcd in "/etc/kubernetes/manifests"
[wait-control-plane] Waiting for the kubelet to boot up the control plane as static Pods from directory "/etc/kubernetes/manifests". This can take up to 4m0s
[kubelet-check] Initial timeout of 40s passed.

	Unfortunately, an error has occurred:
		timed out waiting for the condition

	This error is likely caused by:
		- The kubelet is not running
		- The kubelet is unhealthy due to a misconfiguration of the node in some way (required cgroups disabled)

	If you are on a systemd-powered system, you can try to troubleshoot the error with the following commands:
		- 'systemctl status kubelet'
		- 'journalctl -xeu kubelet'

	Additionally, a control plane component may have crashed or exited when started by the container runtime.
	To troubleshoot, list all containers using your preferred container runtimes CLI.

	Here is one example how you may list all Kubernetes containers running in docker:
		- 'docker ps -a | grep kube | grep -v pause'
		Once you have found the failing container, you can inspect its logs with:
		- 'docker logs CONTAINERID'

error execution phase wait-control-plane: couldn't initialize a Kubernetes cluster
To see the stack trace of this error execute with --v=5 or higher
```
## Second Attempt
```
ckadmin@cka-controller1:~$ sudo kubeadm init --control-plane-endpoint=cka-controller1 --pod-network-cidr 172.16.0.0/16
[init] Using Kubernetes version: v1.20.5
[preflight] Running pre-flight checks
[preflight] Pulling images required for setting up a Kubernetes cluster
[preflight] This might take a minute or two, depending on the speed of your internet connection
[preflight] You can also perform this action in beforehand using 'kubeadm config images pull'
[certs] Using certificateDir folder "/etc/kubernetes/pki"
[certs] Generating "ca" certificate and key
[certs] Generating "apiserver" certificate and key
[certs] apiserver serving cert is signed for DNS names [cka-controller1 kubernetes kubernetes.default kubernetes.default.svc kubernetes.default.svc.cluster.local] and IPs [10.96.0.1 10.10.1.31]
[certs] Generating "apiserver-kubelet-client" certificate and key
[certs] Generating "front-proxy-ca" certificate and key
[certs] Generating "front-proxy-client" certificate and key
[certs] Generating "etcd/ca" certificate and key
[certs] Generating "etcd/server" certificate and key
[certs] etcd/server serving cert is signed for DNS names [cka-controller1 localhost] and IPs [10.10.1.31 127.0.0.1 ::1]
[certs] Generating "etcd/peer" certificate and key
[certs] etcd/peer serving cert is signed for DNS names [cka-controller1 localhost] and IPs [10.10.1.31 127.0.0.1 ::1]
[certs] Generating "etcd/healthcheck-client" certificate and key
[certs] Generating "apiserver-etcd-client" certificate and key
[certs] Generating "sa" key and public key
[kubeconfig] Using kubeconfig folder "/etc/kubernetes"
[kubeconfig] Writing "admin.conf" kubeconfig file
[kubeconfig] Writing "kubelet.conf" kubeconfig file
[kubeconfig] Writing "controller-manager.conf" kubeconfig file
[kubeconfig] Writing "scheduler.conf" kubeconfig file
[kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
[kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
[kubelet-start] Starting the kubelet
[control-plane] Using manifest folder "/etc/kubernetes/manifests"
[control-plane] Creating static Pod manifest for "kube-apiserver"
[control-plane] Creating static Pod manifest for "kube-controller-manager"
[control-plane] Creating static Pod manifest for "kube-scheduler"
[etcd] Creating static Pod manifest for local etcd in "/etc/kubernetes/manifests"
[wait-control-plane] Waiting for the kubelet to boot up the control plane as static Pods from directory "/etc/kubernetes/manifests". This can take up to 4m0s
[kubelet-check] Initial timeout of 40s passed.
[apiclient] All control plane components are healthy after 68.517696 seconds
[upload-config] Storing the configuration used in ConfigMap "kubeadm-config" in the "kube-system" Namespace
[kubelet] Creating a ConfigMap "kubelet-config-1.20" in namespace kube-system with the configuration for the kubelets in the cluster
[upload-certs] Skipping phase. Please see --upload-certs
[mark-control-plane] Marking the node cka-controller1 as control-plane by adding the labels "node-role.kubernetes.io/master=''" and "node-role.kubernetes.io/control-plane='' (deprecated)"
[mark-control-plane] Marking the node cka-controller1 as control-plane by adding the taints [node-role.kubernetes.io/master:NoSchedule]
[bootstrap-token] Using token: r1d5uw.lzg7aa938iiu7ixm
[bootstrap-token] Configuring bootstrap tokens, cluster-info ConfigMap, RBAC Roles
[bootstrap-token] configured RBAC rules to allow Node Bootstrap tokens to get nodes
[bootstrap-token] configured RBAC rules to allow Node Bootstrap tokens to post CSRs in order for nodes to get long term certificate credentials
[bootstrap-token] configured RBAC rules to allow the csrapprover controller automatically approve CSRs from a Node Bootstrap Token
[bootstrap-token] configured RBAC rules to allow certificate rotation for all node client certificates in the cluster
[bootstrap-token] Creating the "cluster-info" ConfigMap in the "kube-public" namespace
[kubelet-finalize] Updating "/etc/kubernetes/kubelet.conf" to point to a rotatable kubelet client certificate and key
[addons] Applied essential addon: CoreDNS
[addons] Applied essential addon: kube-proxy

Your Kubernetes control-plane has initialized successfully!

To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

Alternatively, if you are the root user, you can run:

  export KUBECONFIG=/etc/kubernetes/admin.conf

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

You can now join any number of control-plane nodes by copying certificate authorities
and service account keys on each node and then running the following as root:

  kubeadm join cka-controller1:6443 --token r1d5uw.lzg7aa938iiu7ixm \
    --discovery-token-ca-cert-hash sha256:4444c05c4ed91ce278c48fb6f9128a619b4c9c24a40df5132b64d15c439735d7 \
    --control-plane

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join cka-controller1:6443 --token r1d5uw.lzg7aa938iiu7ixm \
    --discovery-token-ca-cert-hash sha256:4444c05c4ed91ce278c48fb6f9128a619b4c9c24a40df5132b64d15c439735d7

```

## Joining worker1
```
ckadmin@cka-worker1:~$ sudo kubeadm join cka-controller1:6443 --token r1d5uw.lzg7aa938iiu7ixm \
>     --discovery-token-ca-cert-hash sha256:4444c05c4ed91ce278c48fb6f9128a619b4c9c24a40df5132b64d15c439735d7
[preflight] Running pre-flight checks
[preflight] Reading configuration from the cluster...
[preflight] FYI: You can look at this config file with 'kubectl -n kube-system get cm kubeadm-config -o yaml'
[kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
[kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
[kubelet-start] Starting the kubelet
[kubelet-start] Waiting for the kubelet to perform the TLS Bootstrap...

This node has joined the cluster:
* Certificate signing request was sent to apiserver and a response was received.
* The Kubelet was informed of the new secure connection details.

Run 'kubectl get nodes' on the control-plane to see this node join the cluster.
```

## Joining controller2 attempt1
```
kubeadm join cka-controller1:6443 --token r1d5uw.lzg7aa938iiu7ixm \
  --discovery-token-ca-cert-hash sha256:4444c05c4ed91ce278c48fb6f9128a619b4c9c24a40df5132b64d15c439735d7 \
  --control-plane
  ```

## Joining controller2 attempt2
```
ckadmin@cka-controller1:~$ sudo tar -zcvf certs.tgz /etc/kubernetes/pki/*

ckadmin@cka-controller2:~/etc/kubernetes$ sudo kubeadm join cka-controller1:6443 --token r1d5uw.lzg7aa938iiu7ixm     --discovery-token-ca-cert-hash sha256:4444c05c4ed91ce278c48fb6f9128a619b4c9c24a40df5132b64d15c439735d7     --control-plane
[preflight] Running pre-flight checks
[preflight] Reading configuration from the cluster...
[preflight] FYI: You can look at this config file with 'kubectl -n kube-system get cm kubeadm-config -o yaml'
[preflight] Running pre-flight checks before initializing the new control plane instance
[preflight] Pulling images required for setting up a Kubernetes cluster
[preflight] This might take a minute or two, depending on the speed of your internet connection
[preflight] You can also perform this action in beforehand using 'kubeadm config images pull'
[certs] Using certificateDir folder "/etc/kubernetes/pki"
[certs] Using the existing "apiserver-kubelet-client" certificate and key
error execution phase control-plane-prepare/certs: error creating PKI assets: failed to write or validate certificate "apiserver": certificate apiserver is invalid: x509: certificate is valid for cka-controller1, kubernetes, kubernetes.default, kubernetes.default.svc, kubernetes.default.svc.cluster.local, not cka-controller2
To see the stack trace of this error execute with --v=5 or higher
```

### certs needed
```
ckadmin@cka-controller2:/etc/kubernetes/pki$ ls
ca.crt  ca.key  etcd  front-proxy-ca.crt  front-proxy-client.crt  front-proxy-client.key  sa.key  sa.pub

ckadmin@cka-controller2:/etc/kubernetes/pki$ ls etcd/
ca.crt  ca.key  peer.crt  peer.key
```

## Successful attempt controller2
```
ckadmin@cka-controller2:/etc/kubernetes/pki$ sudo kubeadm join cka-controller1:6443 --token r1d5uw.lzg7aa938iiu7ixm     --discovery-token-ca-cert-hash sha256:4444c05c4ed91ce278c48fb6f9128a619b4c9c24a40df5132b64d15c439735d7     --control-plane
[preflight] Running pre-flight checks
[preflight] Reading configuration from the cluster...
[preflight] FYI: You can look at this config file with 'kubectl -n kube-system get cm kubeadm-config -o yaml'
W0407 22:46:01.243437   11515 certs.go:400] assuming external key for front-proxy CA: couldn't load the private key file /etc/kubernetes/pki/front-proxy-ca.key: open /etc/kubernetes/pki/front-proxy-ca.key: no such file or directory
[preflight] Running pre-flight checks before initializing the new control plane instance
[preflight] Pulling images required for setting up a Kubernetes cluster
[preflight] This might take a minute or two, depending on the speed of your internet connection
[preflight] You can also perform this action in beforehand using 'kubeadm config images pull'
[certs] Using certificateDir folder "/etc/kubernetes/pki"
[certs] Using the existing "apiserver" certificate and key
[certs] Using the existing "apiserver-kubelet-client" certificate and key
[certs] Generating "etcd/server" certificate and key
[certs] etcd/server serving cert is signed for DNS names [cka-controller2 localhost] and IPs [10.10.1.32 127.0.0.1 ::1]
[certs] Using the existing "etcd/peer" certificate and key
[certs] Generating "etcd/healthcheck-client" certificate and key
[certs] Using the existing "apiserver-etcd-client" certificate and key
[certs] Valid certificates and keys now exist in "/etc/kubernetes/pki"
[certs] Using the existing "sa" key
[kubeconfig] Generating kubeconfig files
[kubeconfig] Using kubeconfig folder "/etc/kubernetes"
[kubeconfig] Writing "admin.conf" kubeconfig file
[kubeconfig] Writing "controller-manager.conf" kubeconfig file
[kubeconfig] Writing "scheduler.conf" kubeconfig file
[control-plane] Using manifest folder "/etc/kubernetes/manifests"
[control-plane] Creating static Pod manifest for "kube-apiserver"
[control-plane] Creating static Pod manifest for "kube-controller-manager"
[control-plane] Creating static Pod manifest for "kube-scheduler"
[check-etcd] Checking that the etcd cluster is healthy
[kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
[kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
[kubelet-start] Starting the kubelet
[kubelet-start] Waiting for the kubelet to perform the TLS Bootstrap...
[etcd] Announced new etcd member joining to the existing etcd cluster
[etcd] Creating static Pod manifest for "etcd"
[etcd] Waiting for the new etcd member to join the cluster. This can take up to 40s
[upload-config] Storing the configuration used in ConfigMap "kubeadm-config" in the "kube-system" Namespace
[mark-control-plane] Marking the node cka-controller2 as control-plane by adding the labels "node-role.kubernetes.io/master=''" and "node-role.kubernetes.io/control-plane='' (deprecated)"
[mark-control-plane] Marking the node cka-controller2 as control-plane by adding the taints [node-role.kubernetes.io/master:NoSchedule]

This node has joined the cluster and a new control plane instance was created:

* Certificate signing request was sent to apiserver and approval was received.
* The Kubelet was informed of the new secure connection details.
* Control plane (master) label and taint were applied to the new node.
* The Kubernetes control plane instances scaled up.
* A new etcd member was added to the local/stacked etcd cluster.

To start administering your cluster from this node, you need to run the following as a regular user:

	mkdir -p $HOME/.kube
	sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
	sudo chown $(id -u):$(id -g) $HOME/.kube/config

Run 'kubectl get nodes' to see this node join the cluster.
```

## Proof
```
ckadmin@cka-controller2:~$ kubectl get pods -A -o wide
NAMESPACE     NAME                                      READY   STATUS    RESTARTS   AGE    IP           NODE              NOMINATED NODE   READINESS GATES
kube-system   coredns-74ff55c5b-9rptk                   0/1     Pending   0          29m    <none>       <none>            <none>           <none>
kube-system   coredns-74ff55c5b-p4jxh                   0/1     Pending   0          29m    <none>       <none>            <none>           <none>
kube-system   etcd-cka-controller1                      1/1     Running   0          29m    10.10.1.31   cka-controller1   <none>           <none>
kube-system   etcd-cka-controller2                      1/1     Running   0          104s   10.10.1.32   cka-controller2   <none>           <none>
kube-system   kube-apiserver-cka-controller1            1/1     Running   0          29m    10.10.1.31   cka-controller1   <none>           <none>
kube-system   kube-apiserver-cka-controller2            1/1     Running   0          104s   10.10.1.32   cka-controller2   <none>           <none>
kube-system   kube-controller-manager-cka-controller1   1/1     Running   1          29m    10.10.1.31   cka-controller1   <none>           <none>
kube-system   kube-controller-manager-cka-controller2   1/1     Running   0          110s   10.10.1.32   cka-controller2   <none>           <none>
kube-system   kube-proxy-7vz6c                          1/1     Running   0          111s   10.10.1.32   cka-controller2   <none>           <none>
kube-system   kube-proxy-bm2cc                          1/1     Running   0          26m    10.10.1.61   cka-worker1       <none>           <none>
kube-system   kube-proxy-drkl8                          1/1     Running   0          29m    10.10.1.31   cka-controller1   <none>           <none>
kube-system   kube-scheduler-cka-controller1            1/1     Running   1          29m    10.10.1.31   cka-controller1   <none>           <none>
kube-system   kube-scheduler-cka-controller2            1/1     Running   0          109s   10.10.1.32   cka-controller2   <none>           <none>
```
