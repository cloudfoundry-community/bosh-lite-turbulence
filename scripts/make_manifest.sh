#!/usr/bin/env bash

original_manifest=/opt/bosh-provisioner/manifest.original.yml
manifest=/opt/bosh-provisioner/manifest.yml

if [ ! -f $original_manifest ]; then
    cp $manifest $original_manifest
fi

cd /vagrant/templates/
sudo spruce merge \
     turbulence-api.yml \
     turbulence-bosh-lite-jobs.yml \
     $original_manifest \
     turbulence-bosh-lite-releases.yml > /vagrant/tmp/turbulence-bosh-lite.yml
