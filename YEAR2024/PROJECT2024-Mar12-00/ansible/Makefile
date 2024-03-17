ansible-install:
	@sudo apt update
	@sudo apt install -y software-properties-common
	@sudo add-apt-repository --yes --update ppa:ansible/ansible
	@sudo apt install -y ansible

set-git-config:
	@git config --global user.email "bca.anup@gmail.com"
	@git config --global user.name "Anup Kumar Mondal"

all: ansible-install set-git-config

.PHONY: ansible-install set-git-config