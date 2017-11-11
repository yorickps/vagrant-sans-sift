#!/bin/bash

wget -q https://github.com/sans-dfir/sift-cli/releases/download/v1.5.1/sift-cli-linux -O sift-cli-linux &&\
wget -q https://github.com/sans-dfir/sift-cli/releases/download/v1.5.1/sift-cli-linux.sha256.asc -O sift-cli-linux.sha256.asc

#gpg --keyserver pgp.mit.edu --recv-keys 22598A94 &&\
#sha256sum -c sift-cli-linux.sha256.asc
sudo -s
loadkeys be
apt-get install -y salt-minion lxde xinit &&\

echo "greeter-show-manual-login=true" > /usr/share/lightdm/lightdm.conf.d/50-show-login.conf

#cp /etc/X11/xinit/xinitrc /home/ubuntu/.xinitrc &&\
#chown ubuntu: /home/ubuntu/.xinitrc &&\
#chmod 644 /home/ubuntu/.xinitrc

systemctl disable salt-minion &&\
systemctl stop salt-minion

cp -p sift-cli-linux /usr/local/bin/sift &&\
chmod 755 /usr/local/bin/sift
sift install --user=ubuntu &&\
sift upgrade
