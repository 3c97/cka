# Referencias
https://github.com/defo89/kubernetes-the-hard-way-lab

Change IP Address
https://linuxconfig.org/how-to-configure-static-ip-address-on-ubuntu-18-04-bionic-beaver-linux

# Lab design

OS Ubuntu 18.04 LTS
network solution weave net
coredns

 Name | IP Address | Role
----- | ---------- | ----
networker | 10.10.1.250 | DHCP and DNS Server
media | 10.10.1.200 | NFS Server
haproxy1 | 10.10.1.20 | Load Balancer for k8s API
k8s-controller1 | 10.10.1.31 | Controller node
k8s-controller2 | 10.10.1.32 | Controller node
k8s-controller3 | 10.10.1.33 | Controller node
k8s-worker1 | 10.10.1.61 | Worker node
k8s-worker2 | 10.10.1.62 | Worker node
k8s-worker3 | 10.10.1.63 | Worker node

Name | Network | Description
---- | ------- | -----------
vmnet2 | 10.10.1.0/24 | External LAN
vmnet3 | 20.10.1.0/22 | k8s POD Network
vmnet4 | 30.10.1.0/24 | k8s Service Network
Host | 10.10.1.15/32 | k8s API server (external IP haproxy)
Host | 30.10.1.1 | k8s API server (internal IP)
Host | 30.10.1.10 | k8s DNS

## User and password
ckadmin/cklab01

## Common location of all VMs
/mnt/vm-location/VirtualMachines/


## Install kubectl
```
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
```

## Generating certificates Certificate Authority
```
ckadmin@cka-networker:~/certs$ cfssl gencert -initca ca-csr.json | cfssljson -bare ca
2021/02/23 13:27:22 [INFO] generating a new CA key and certificate from CSR
2021/02/23 13:27:22 [INFO] generate received request
2021/02/23 13:27:22 [INFO] received CSR
2021/02/23 13:27:22 [INFO] generating key: rsa-2048
2021/02/23 13:27:22 [INFO] encoded CSR
2021/02/23 13:27:22 [INFO] signed certificate with serial number 262040894675222983337224295497404346672899472466
ckadmin@cka-networker:~/certs$ ls -las
```

## Generating certs for admin
```
ckadmin@cka-networker:~/certs$ cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=kubernetes admin-csr.json | cfssljson -bare admin
2021/02/23 13:33:14 [INFO] generate received request
2021/02/23 13:33:14 [INFO] received CSR
2021/02/23 13:33:14 [INFO] generating key: rsa-2048
2021/02/23 13:33:14 [INFO] encoded CSR
2021/02/23 13:33:14 [INFO] signed certificate with serial number 115834633193016946719357336174025145457498561376
2021/02/23 13:33:14 [WARNING] This certificate lacks a "hosts" field. This makes it unsuitable for
websites. For more information see the Baseline Requirements for the Issuance and Management
of Publicly-Trusted Certificates, v.1.1.6, from the CA/Browser Forum (https://cabforum.org);
specifically, section 10.2.3 ("Information Requirements").
```

## network config
```
network:
  ethernets:
    ens33:
      dhcp4: no
      addresses: [10.10.1.31/24]
      gateway4: 10.10.1.2
      nameservers:
               addresses: [10.10.1.250]
    ens37:
      dhcp4: no
      addresses: [20.10.1.31/24]

    ens38:
      dhcp4: no
      addresses: [30.10.1.31/24]
  version: 2
```
