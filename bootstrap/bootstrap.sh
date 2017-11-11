#!/bin/bash

wget -q https://github.com/sans-dfir/sift-cli/releases/download/v1.5.1/sift-cli-linux -O sift-cli-linux &&\
wget -q https://github.com/sans-dfir/sift-cli/releases/download/v1.5.1/sift-cli-linux.sha256.asc -O sift-cli-linux.sha256.asc

#gpg --keyserver pgp.mit.edu --recv-keys 22598A94 &&\
#sha256sum -c sift-cli-linux.sha256.asc

sudo apt-get install -y salt-minion

sudo cp -p sift-cli-linux /usr/local/bin/sift &&\
sudo chmod 755 /usr/local/bin/sift
sift install
