#!/bin/bash

HOST_PREFIX=${HOST_PREFIX:-"rpi"}
#NET_DEVICE=${NET_DEVICE:="eth0"}

for dev in $(ls /sys/class/net)
do
	if [[ "$dev" == *"lo"* ]]; then
	  continue
	fi
	if [[ ! -z $(grep DEVTYPE=wlan /sys/class/net/$dev/uevent) ]]; then
 	   continue
	fi
	MAC=$(cat /sys/class/net/$dev/address)
	NET_DEVICE=$dev
done

LAST_MAC4=$(sed -rn "s/^.*([0-9A-F:]{5})$/\1/gi;s/://p" /sys/class/net/$NET_DEVICE/address)
NEW_HOSTNAME=${HOST_PREFIX}-${LAST_MAC4:-0000}

NEW_HOSTNAME=$(grep -i $MAC /boot/mac-names.txt | cut -f2)

echo $NEW_HOSTNAME  > /etc/hostname
/bin/hostname -F /etc/hostname

