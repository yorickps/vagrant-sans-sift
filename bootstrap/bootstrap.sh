#!/bin/bash

wget -q https://github.com/sans-dfir/sift-cli/releases/download/v1.5.1/sift-cli-linux -O sift-cli-linux &&\
wget -q https://github.com/sans-dfir/sift-cli/releases/download/v1.5.1/sift-cli-linux.sha256.asc -O sift-cli-linux.sha256.asc

sudo -s
useradd test -s /bin/bash -m
chpasswd << 'END'
test:test
END
loadkeys be
apt-get -y update &&\
apt-get install -y salt-minion lxde xinit

echo "greeter-show-manual-login=true" > /usr/share/lightdm/lightdm.conf.d/50-show-login.conf

systemctl disable salt-minion &&\
systemctl stop salt-minion

cp -p sift-cli-linux /usr/local/bin/sift &&\
chmod 755 /usr/local/bin/sift
sift install --user=test &&\
sift upgrade
