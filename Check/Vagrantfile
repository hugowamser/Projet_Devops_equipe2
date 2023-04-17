
Vagrant.configure("2") do |config|
		
		workers=5
	
		config.vm.define "ansible" do |ansible|
			ansible.vm.box = "bento/ubuntu-22.04"
			ansible.vm.network "private_network", ip: "192.168.2.2"
			ansible.vm.hostname = "ansible"
			
			ansible.vm.provider "virtualbox" do |v|
			  v.name = "ansible"
			  v.memory = 2048
			  v.cpus = 2
			end
			
			ansible.vm.provision "shell", inline: <<-SHELL
				apt-get update
        		apt-get install -y bash vim python3-pip
				ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
      			cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
      			chmod 600 ~/.ssh/authorized_keys
				apt-get install -y software-properties-common
      			apt-add-repository --yes --update ppa:ansible/ansible
      			apt-get install -y ansible
				 # Update the package index and install required dependencies
				apt-get update
				apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

				# Add Docker's official GPG key
				curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

				# Add Docker's stable repository to APT sources
				echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

				# Update the package index and install Docker
				apt-get update
				apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose

				# Add the current user to the "docker" group so that you can run Docker without sudo
				usermod -aG docker vagrant
					SHELL
				end

		config.vm.define "wordpress" do |wordpress|
			wordpress.vm.box = "bento/ubuntu-22.04"
			wordpress.vm.network "private_network", ip: "192.168.5.2"
			wordpress.vm.hostname = "wordpress"
			
			wordpress.vm.provider "virtualbox" do |v|
			v.name = "wordpress"
			v.memory = 2048
			v.cpus = 2
			end
			
			wordpress.vm.provision "shell", inline: <<-SHELL
        		apt-get update
        		apt-get install -y bash vim python3-pip
				ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
      			cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
      			chmod 600 ~/.ssh/authorized_keys
				# Update the package index and install required dependencies
				apt-get update
				apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

				# Add Docker's official GPG key
				curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

				# Add Docker's stable repository to APT sources
				echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

				# Update the package index and install Docker
				apt-get update
				apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose

				# Add the current user to the "docker" group so that you can run Docker without sudo
				usermod -aG docker vagrant
      		SHELL
			end


		config.vm.define "promgraf" do |promgraf|
			promgraf.vm.box = "bento/ubuntu-22.04"
			promgraf.vm.network "private_network", ip: "192.168.4.2"
			promgraf.vm.hostname = "promgraf"
			
			promgraf.vm.provider "virtualbox" do |v|
			v.name = "promgraf"
			v.memory = 2048
			v.cpus = 2
			end
			
			promgraf.vm.provision "shell", inline: <<-SHELL
       			apt-get update
        		apt-get install -y bash vim python3-pip
				ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
      			cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
      			chmod 600 ~/.ssh/authorized_keys
				# Update the package index and install required dependencies
				apt-get update
				apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

				# Add Docker's official GPG key
				curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

				# Add Docker's stable repository to APT sources
				echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

				# Update the package index and install Docker
				apt-get update
				apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose

				# Add the current user to the "docker" group so that you can run Docker without sudo
				usermod -aG docker vagrant
      		SHELL
			end
		
		config.vm.define "db" do |db|
			db.vm.box = "bento/ubuntu-22.04"
			db.vm.network "private_network", ip: "192.168.2.3"
			db.vm.hostname = "db"
			
			db.vm.provider "virtualbox" do |v|
			v.name = "db"
			v.memory = 2048
			v.cpus = 2
			end
			
			db.vm.provision "shell", inline: <<-SHELL
       			apt-get update
        		apt-get install -y bash vim python3-pip
				ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
      			cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
      			chmod 600 ~/.ssh/authorized_keys
				# Update the package index and install required dependencies
				apt-get update
				apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

				# Add Docker's official GPG key
				curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

				# Add Docker's stable repository to APT sources
				echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

				# Update the package index and install Docker
				apt-get update
				apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose

				# Add the current user to the "docker" group so that you can run Docker without sudo
				usermod -aG docker vagrant
      		SHELL
			end

		config.vm.define "winserv" do |winserv|
			winserv.vm.box = "StefanScherer/windows_2019"
			winserv.vm.network "private_network", ip: "192.168.3.1", bridge: "TP-Link GIGABIT ETHERNET PCI EXPRESS ADAPTER"
			winserv.vm.hostname = "winserv"
					
			winserv.vm.provider "virtualbox" do |v|
			v.gui = true
			v.name = "winserv"
			v.memory = 4096
			v.cpus = 2
			end
					
			winserv.vm.provision "shell", inline: <<-SHELL
				# Download the French language pack for Windows Server 2019
				Invoke-WebRequest -Uri "https://download.microsoft.com/download/1/4/F/14F9DDB9-AAD9-4C1B-8EC2-2D49FDD1F11B/LIP/fr-fr/x64/WindowsServerLanguagePack_x64_fr-fr.cab" -OutFile "$env:TEMP\WindowsServerLanguagePack_x64_fr-fr.cab"

				# Install the French language pack
				Dism /Online /Add-Package /PackagePath:"$env:TEMP\WindowsServerLanguagePack_x64_fr-fr.cab" /NoRestart
		  
				# Set the Windows UI language to French
				Set-WinSystemLocale fr-FR
		  
				# Disable Internet Explorer Enhanced Security Configuration
				Disable-IEESC
		  
				# Reboot the machine to apply changes
				Restart-Computer -Force
			SHELL
			end
		
end