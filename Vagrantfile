Vagrant.configure("2") do |config|
    config.vm.define "gateway" do |gateway|
        gateway.vm.box = "ubuntu/focal64"
        gateway.vm.hostname = "gateway"
        gateway.vm.network "private_network", ip: "11.0.0.10", virtualbox__intnet: true
        
        gateway.ssh.insert_key = false
        gateway.ssh.private_key_path = ['~/.vagrant.d/insecure_private_key', '~/.ssh/id_rsa']
        gateway.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"

        gateway.vm.provision :shell, privileged: false, :path => "setup/gateway.sh"

        gateway.vm.provider "virtualbox" do |vb|
            vb.gui = false
            vb.cpus = 1
            vb.memory = "1024"  
        
        end

    end
    

    config.vm.define "attacker" do |attacker|
        attacker.vm.box = "ubuntu/focal64"
        attacker.vm.hostname = "attacker"
        attacker.vm.network "private_network", ip: "172.89.0.10", virtualbox__intnet: true

        attacker.ssh.insert_key = false
        attacker.ssh.private_key_path = ['~/.vagrant.d/insecure_private_key', '~/.ssh/id_rsa']
        attacker.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"

        attacker.vm.provision :shell, privileged: false, :path => "setup/attacker.sh"

        attacker.vm.provider "virtualbox" do |vb|
            vb.gui = false
            vb.cpus = 1
            vb.memory = "1024"  

        end
    
    end
    
    config.vm.define "server" do |server|
        server.vm.box = "ubuntu/focal64"
        server.vm.hostname = "server"
        server.vm.network "private_network", ip: "10.0.0.10", virtualbox__intnet: true

        server.ssh.insert_key = false
        server.ssh.private_key_path = ['~/.vagrant.d/insecure_private_key', '~/.ssh/id_rsa']
        server.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"

        server.vm.provision :shell, privileged: false, :path => "setup/server.sh"

        server.vm.provider "virtualbox" do |vb|
            vb.gui = false
            vb.cpus = 1
            vb.memory = "1024"
        
        end
    
    end

end