set-executionpolicy bypass -scope currentuser
install-module -name PSCUCM

[string] $mac = read-host -prompt "Geben Sie die MAC des Tel ein"
[string] $dpoolname = read-host -prompt "Geben Sie den DevicePoolName ein"

add-phone 
-macaddress $mac 
-product SIP
-protocolside User
-deviceoolname $dpoolname
