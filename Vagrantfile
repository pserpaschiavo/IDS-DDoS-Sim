Vagrant.configure("2") do |config|
    config.vm.define "gateway" do |gateway|
        gateway.vm.box = "ubuntu/focal64"
        gateway.vm.hostname = "gateway"
        gateway.vm.network "private_network", ip: "11.0.0.10", virtualbox__intnet: true
        
        gateway.ssh.insert_key = false
        gateway.ssh.private_key_path = ['~/.vagrant.d/insecure_private_key', '~/.ssh/id_rsa']
        gateway.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"

        gateway.vm.provision "shell", privileged: true, inline: <<-SHELL
            apt-get install -y net-tools
            ifconfig enp0s8:0 172.89.0.100
            ifconfig enp0s8:1 10.0.0.100
            ifconfig
        SHELL

        gateway.vm.provider "virtualbox" do |vb|
            vb.gui = false
            vb.cpus = 2
            vb.memory = "2048"  
        
        end

    end
    

    config.vm.define "attacker" do |attacker|
        attacker.vm.box = "ubuntu/focal64"
        attacker.vm.hostname = "attacker"
        attacker.vm.network "private_network", ip: "172.89.0.10", virtualbox__intnet: true

        attacker.ssh.insert_key = false
        attacker.ssh.private_key_path = ['~/.vagrant.d/insecure_private_key', '~/.ssh/id_rsa']
        attacker.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"

        attacker.vm.provision "shell", privileged: true, inline: <<-SHELL
            apt update
            apt install -y net-tools hping3
            route add default gw 172.89.0.100
            route add -net 10.0.0.0/24 dev enp0s8
            ifconfig
        SHELL

        attacker.vm.provider "virtualbox" do |vb|
            vb.gui = false
            vb.cpus = 2
            vb.memory = "2048"  

        end
    
    end
    
    config.vm.define "server" do |server|
        server.vm.box = "ubuntu/focal64"
        server.vm.hostname = "server"
        server.vm.network "private_network", ip: "10.0.0.10", virtualbox__intnet: true

        server.ssh.insert_key = false
        server.ssh.private_key_path = ['~/.vagrant.d/insecure_private_key', '~/.ssh/id_rsa']
        server.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"

        server.vm.provision "shell", privileged: true, inline: <<-SHELL
            apt-get install -y net-tools
            route add default gw 10.0.0.100
            route add -net 172.89.0.0/24 dev enp0s8
            ifconfig
        SHELL

        server.vm.provider "virtualbox" do |vb|
            vb.gui = false
            vb.cpus = 1
            vb.memory = "1024"
        
        end
    
    end

end