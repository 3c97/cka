# Networking k8s troubleshooting

 https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/network-plugins/

 Check that `sysctl -a | grep bridge-nf-call-iptables` equals 1 to ensure that the iptables proxy is working correctly
