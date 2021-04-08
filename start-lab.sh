#!/usr/bin/env bash

# Start the lab based on vmware
startVM(){
  local vm=${1}
  echo "start VM: $vm"
  /usr/bin/vmware -x $vm
}

# list of VMs
for value in \
/mnt/vm-location/VirtualMachines/cka-controller1/cka-controller1.vmx \
/mnt/vm-location/VirtualMachines/cka-controller2/cka-controller2.vmx \
/mnt/vm-location/VirtualMachines/cka-worker1/cka-worker1.vmx 
do
  startVM $value
done
