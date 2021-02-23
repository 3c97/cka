# Generating kubernetes

```
cfssl gencert \
  -ca=ca.pem \
  -ca-key=ca-key.pem \
  -config=ca-config.json \
  -hostname=30.10.1.61,30.10.1.62,30.10.1.63,${KUBERNETES_PUBLIC_ADDRESS},127.0.0.1,${KUBERNETES_HOSTNAMES} \
  -profile=kubernetes \
  kubernetes-csr.json | cfssljson -bare kubernetes
```

```
cfssl gencert -initca ca-csr.json | cfssljson -bare ca
```
```
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=kubernetes admin-csr.json | cfssljson -bare admin
```
```
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -hostname=k8s-worker1.cka-lab.lo,10.10.1.61,30.10.1.61 -profile=kubernetes k8s-worker1-csr.json | cfssljson -bare k8s-worker1.cka-lab.lo
```
```
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -hostname=k8s-worker1.cka-lab.lo,10.10.1.61,30.10.1.61 -profile=kubernetes k8s-worker1-csr.json | cfssljson -bare k8s-worker1.cka-lab.lo
```
```
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -hostname=k8s-worker2.cka-lab.lo,10.10.1.62,30.10.1.62 -profile=kubernetes k8s-worker2-csr.json | cfssljson -bare k8s-worker2.cka-lab.lo
```

```
cfssl gencert -ca=ca.pem\
  -ca-key=ca-key.pem\
  -config=ca-config.json\
  -hostname=k8s-worker3.cka-lab.lo,10.10.1.63,30.10.1.63 \
  -profile=kubernetes\
   k8s-worker3-csr.json | cfssljson -bare k8s-worker3.cka-lab.lo
```

```
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=kubernetes k8s-controller-manager-csr.json| cfssljson -bare k8s-controller-manager
```

```
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=kubernetes k8s-proxy-csr.json | cfssljson -bare k8s-proxy
```

```
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -configure=ca-config.json -profile=kubernetes k8s-scheduler-csr.json | cfssljson -bare k8s-scheduler
```

```
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=kubernetes k8s-scheduler-csr.json | cfssljson -bare k8s-scheduler
```

```
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=kubernetes service-account-csr.json | cfssljson -bare service-account
```
