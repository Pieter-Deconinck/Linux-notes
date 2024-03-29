07/02/2023

# Homelab

# Installing virtualbox

`sudo apt update` && `sudo apt upgrade`
`sudo apt install virtualbox`
`sudo apt install virtualbox-ext-pack`

# Installing vagrant
check for latest vagrant version: https://developer.hashicorp.com/vagrant/downloads

`wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyringshashicorp-archive-keyring.gpg`

`echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list`

`sudo apt update && sudo apt install vagrant`

# vagrant

Created a vagrant root directory in `/mount/raid` (this is the raid array location) `sudo mkdir vagrant`
in the newly created directory make a new vagrant box and initialize vagrant `sudo vagrant init bento/ubuntu-22.04`


add a vagrant box without creating a new Vagrantfile `vagrant box add bento/ubuntu-22.04`

# virtualbox

list virtualbox properties `vboxmanage list systemproperties`
Change default machinefolder for virtualbox `vboxmanage setproperty machinefolder /mount/raid/VirtualBox-VMs`

# Vagrantfile

Changed the name for the vm:

        config.vm.define "zatreVM"  
        config.vm.hostname = "zatreVM"  
        config.vm.provider :virtualbox do |vb|
            vb.name = "zatreVM"
        end

# Vagrantfile NAS

        config.vm.define "NASVM"
        config.vm.hostname = "NASVM"
        config.vm.provider :virtualbox do |vb|
            vb.name = "NASVM"
        end

        config.vm.network "public_network"

        config.vm.provision :shell, path: "/mount/raid/vagrant/NAS/NASVMprovisioning/NASVMprovision.sh"

# NAS provision script


# checkmk installation on homelab

`sudo apt update`  
`wget https://download.checkmk.com/checkmk/2.1.0p21/check-mk-raw-2.1.0p21_0.jammy_amd64.deb`  
`sudo apt install -y ./check-mk-raw-2.1.0p21_0.jammy_amd64.deb`  

https://www.digitalocean.com/community/tutorials/how-to-monitor-server-health-with-checkmk-2-0-on-ubuntu-20-04
# Extra
check vagrant version: `vagrant --version`

links:
https://phoenixnap.com/kb/install-virtualbox-on-ubuntu  
https://linuxize.com/post/how-to-install-vagrant-on-ubuntu-20-04/  
https://developer.hashicorp.com/vagrant/downloads  
https://developer.hashicorp.com/vagrant/tutorials  