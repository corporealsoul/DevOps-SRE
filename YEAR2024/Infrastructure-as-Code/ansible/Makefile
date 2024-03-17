ansible:
	@sudo apt update
	@sudo apt install -y software-properties-common
	@sudo add-apt-repository --yes --update ppa:ansible/ansible
	@sudo apt install -y ansible

git:
	@sudo apt update
	@sudo apt install git
	@git config --global user.email "bca.anup@gmail.com"
	@git config --global user.name "Anup Kumar Mondal"

java:
	@sudo apt update
	@sudo apt install fontconfig openjdk-17-jre


all: ansible git java
.PHONY: ansible git java