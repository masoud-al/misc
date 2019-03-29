!#/bin/sh

#remove old configuration packages we are going to use systemd
pacman -R --noconfirm wpa_actiond
pacman -R --noconfirm netctl 
pacman -R --noconfirm ifplugd
pacman -R --noconfirm openresolv
systemctl disable netctl
systemctl disable netctl@wlan0
systemctl disable netctl-auto@wlan0

cp hostnames/* /boot
cp changehostname.service /etc/systemd/system/
systemctl restart changehostname
systemctl enable changehostname


cp wpa_supplicant-wlan0.conf /etc/wpa_supplicant/
cp 20-wired.network /etc/systemd/network/
cp 25-wireless.network /etc/systemd/network/

mv /etc/resolv.conf /etc/resolv.conf.old
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
    pacman -S --noconfirm avahi
fi

cp multiple.service /etc/avahi/services/


systemctl restart avahi-daemon

systemctl enable avahi-daemon



# enable sudo
# add groups: tty lp wheel uucp  video users  plugdev printadmin usbtmc