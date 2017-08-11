# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

Vagrant.require_version '>= 1.8.6'
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  
  _conf = YAML.load(
    File.open(
      File.join(File.dirname(__FILE__), 'provision/default.yml'),
      File::RDONLY
    ).read
  )

  if File.exists?(File.join(File.dirname(__FILE__), 'site.yml'))
    _site = YAML.load(
      File.open(
        File.join(File.dirname(__FILE__), 'site.yml'),
        File::RDONLY
      ).read
    )

    _conf.merge!(_site) if _site.is_a?(Hash)
  end

  # forcing config variables
  _conf["vagrant_dir"] = "/vagrant"

  config.vm.define _conf['hostname'] do |v|
  end

  config.vm.box = _conf['vm_box']
  config.ssh.forward_agent = true
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.box_check_update = true

  config.vm.hostname = _conf['hostname']
  config.vm.network :private_network, ip: _conf['ip']

  if _conf['synced_folder']
    config.vm.synced_folder _conf['synced_folder'],
      _conf['document_root'], :create => "true", :mount_options => ['dmode=755', 'fmode=644']
  end

  

  if Vagrant.has_plugin?('vagrant-hostupdater')
    config.hostsupdater.remove_on_suspend = true
  end

  if Vagrant.has_plugin?('vagrant-vbguest')
    config.vbguest.auto_update = false
  end

  config.vm.provider :virtualbox do |vb|
    vb.linked_clone = _conf['linked_clone']
    vb.name = _conf['hostname']
    vb.memory = _conf['memory'].to_i
    vb.cpus = _conf['cpus'].to_i
    if 1 < _conf['cpus'].to_i
      vb.customize ['modifyvm', :id, '--ioapic', 'on']
    end
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
  end

  config.vm.provision :shell, path: _conf['tools']
end
