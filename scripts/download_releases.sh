#!/usr/bin/env bash

releases=( "bosh-warden-cpi:cppforlife/bosh-warden-cpi-release"
        "bosh:cloudfoundry/bosh"
        "garden-linux:cloudfoundry-incubator/garden-linux-release"
        "turbulence:cppforlife/turbulence-release" )

for release in "${releases[@]}" ; do
    name="${release%%:*}"
    url="${release##*:}"
    manifest=/opt/bosh-provisioner/manifest.yml
    version=`sudo grep -A1 ${name}-release $manifest | grep version | cut -d' ' -f4`
    wget -q -c https://bosh.io/d/github.com/${url}?v=${version} \
         -O /vagrant/tmp/${name}-release.tgz
done
