!#/bin/sh

#remove old configuration packages we are going to use systemd
pacman -R --confirm wpa_actiond
pacman -R --confirm netctl 
pacman -R --confirm ifplugd
pacman -R --confirm openresolv
systemctl disable netctl
systemctl disable netctl@wlan0
systemctl disable netctl-auto@wlan0

cp hostnames/* /boot
cp changehostname.service /etc/systemd/system/
cp wpa_supplicant-wlan0.conf /etc/wpa_supplicant/
cp 20-wired.network /etc/systemd/network/
cp 25-wireless.network /etc/systemd/network/
cp multiple.service /etc/avahi/services/

ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf

systemctl restart systemd-networkd
systemctl restart wpa_supplicant@wlan0
systemctl restart systemd-resolved

systemctl enable systemd-networkd
systemctl enable wpa_supplicant@wlan0
systemctl enable systemd-resolved


pacman -Q --quiet avahi
if [ $? -eq 1 ]
then
    pacman -S --confirm avahi
fi

systemctl restart avahi-daemon

systemctl enable avahi-daemon

