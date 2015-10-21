# Bosh-lite + Turbulence

This repository provides the fasts way to setup [bosh-lite](https://github.com/cloudfoundry/bosh-lite.git) with [turbulence](https://github.com/cppforlife/turbulence-release).

## Getting started
```
git clone https://github.com/cloudfoundry-community/bosh-lite-turbulence
cd bosh-lite-turbulence

vagrant plugin install vagrant-bosh
vagrant up
vagrant provision
```

Turbulence should now be accessible [here](https://192.168.50.4:8080) (username: turbulence, password: p)
