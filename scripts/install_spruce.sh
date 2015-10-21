#!/usr/bin/env bash

base_url=https://github.com/geofffranks/spruce/releases/download
version=0.12.0

cd /tmp
wget -q -c ${base_url}/v${version}/spruce_${version}_linux_amd64.tar.gz
tar -zxvf spruce_*.tar.gz
sudo mv spruce_*/spruce /usr/local/bin/
