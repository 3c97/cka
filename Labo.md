# Referencias
https://github.com/defo89/kubernetes-the-hard-way-lab

# Lab design

OS Ubuntu 18.04 LTS

 Name | IP Address | Role
----- | ---------- | ----
networker | 10.10.1.1 | DHCP and DNS Server
media | 10.10.1.200 | NFS Server
haproxy1 | 10.10.1.20 | Load Balancer for k8s API
k8s-controller1 | 10.10.1.31 | Controller node
k8s-controller2 | 10.10.1.32 | Controller node
k8s-controller3 | 10.10.1.33 | Controller node
k8s-worker1 | 10.10.1.61 | Worker node
k8s-worker2 | 10.10.1.62 | Worker node
k8s-worker3 | 10.10.1.63 | Worker node

Network | Description
------- | -----------
10.10.1.0/24 | External LAN
20.10.1.0/22 | k8s POD Network
30.10.1.0/24 | k8s Service Network
10.10.1.15/32 | k8s API server (external IP haproxy)
30.10.1.1 | k8s API server (internal IP)
30.10.1.10 | k8s DNS
