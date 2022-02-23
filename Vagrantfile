Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/bionic64"

	config.vm.define "terraform" do |tf|
		tf.vm.network "private_network",
			ip: "192.168.89.10"

		# Instalando Terraform
		tf.vm.provision "shell",
			inline: $script_terraform

		# Instalando AWS
		tf.vm.provision "shell",
			inline: $script_unzip
		tf.vm.provision "shell",
			inline: $script_aws
	end
end

$script_terraform = <<-'SCRIPT'
	curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && \
	sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
	sudo apt-get update && sudo apt-get install terraform
SCRIPT

$script_unzip = <<-'SCRIPT'
	sudo apt-get update && sudo apt-get install unzip
SCRIPT

$script_aws = <<-'SCRIPT'
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	unzip awscliv2.zip
	sudo ./aws/install
SCRIPT
