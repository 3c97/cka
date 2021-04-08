#!/usr/bin/env bash

# Start the lab based on vmware
stopVM(){
  local vm=${1}
  echo "Stop VM: $vm"
  /usr/bin/vmrun -T player stop $vm
}

# list of VMs
for value in \
/mnt/vm-location/VirtualMachines/cka-worker1/cka-worker1.vmx \
/mnt/vm-location/VirtualMachines/cka-controller2/cka-controller2.vmx \
/mnt/vm-location/VirtualMachines/cka-controller1/cka-controller1.vmx 
do
  stopVM $value
done
