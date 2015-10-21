Vagrant.configure('2') do |config|
  config.vm.box = 'cloudfoundry/bosh-lite'

  config.vm.provider :virtualbox do |v, override|
    override.vm.box_version = '9000.56.0' # ci:replace
    # To use a different IP address for the bosh-lite director, uncomment this line:
    # override.vm.network :private_network, ip: '192.168.59.4', id: :local
  end

  config.vm.provider :aws do |v, override|
    override.vm.box_version = '9000.56.0' # ci:replace
    # To turn off public IP echoing, uncomment this line:
    # override.vm.provision :shell, id: "public_ip", run: "always", inline: "/bin/true"

    # To turn off CF port forwarding, uncomment this line:
    # override.vm.provision :shell, id: "port_forwarding", run: "always", inline: "/bin/true"

    # Following minimal config is for Vagrant 1.7 since it loads this file before downloading the box.
    # (Must not fail due to missing ENV variables because this file is loaded for all providers)
    v.access_key_id = ENV['BOSH_AWS_ACCESS_KEY_ID'] || ''
    v.secret_access_key = ENV['BOSH_AWS_SECRET_ACCESS_KEY'] || ''
    v.ami = ''
  end

  #  %w(install_spruce make_manifest bosh_provisioner).each do |script|
  %w(install_spruce make_manifest download_releases).each do |script|
    config.vm.provision :shell, path: "scripts/#{script}.sh"
  end

  manifest = 'tmp/turbulence-bosh-lite.yml'
  config.vm.provision "bosh" do |c|
    c.manifest = IO.read(manifest)
  end if File.exist?(manifest)
end
