# 1. Telnet or SSH into the target Switch
# 2. Login using Telnet/SSH account
# 3. Lets assume we'd like to assign port 2 to VLAN 7

# enable command mode if not already 
en

# enter config mode
conf t

# switch to port 2
int 2

# switch to vlan 7
vlan 7

# set port 2 as untagged for vlan 7
untagged 2

# show running port configs
sho int 2

# done
