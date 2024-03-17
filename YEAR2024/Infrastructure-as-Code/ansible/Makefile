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

maven:
	@sudo apt update
	@sudo apt install maven

SHELL := /bin/bash
java-env:
	@unset JAVA_HOME
	@chmod +x ./scripts/bash/java_environment_variable.sh
	@./scripts/bash/java_environment_variable.sh

maven-env:
	@chmod +x ./scripts/bash/maven_environment_variable.sh
	@./scripts/bash/maven_environment_variable.sh

all: ansible git java maven java-env maven-env
.PHONY: all