#!/usr/bin/env bash

/opt/bosh-provisioner/assets/bosh-provisioner \
    -configPath=/opt/bosh-provisioner/config.json \
    2>/tmp/provisioner.log
