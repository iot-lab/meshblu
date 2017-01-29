#!/bin/bash -e

install_docker() {
	sudo apt-get install docker.io
	sudo adduser $USER docker
	NOTE="reboot or logout/login for group to take effect"
}

install_docker_compose() {
	URL_BASE="https://github.com/docker/compose/releases/download"
	VERSION=1.8.1

	curl -o docker-compose -L \
		"$URL_BASE/$VERSION/docker-compose-$(uname -s)-$(uname -m)"
	chmod +x docker-compose
	sudo mv -f docker-compose /usr/local/bin
}

main() {
	if [ "$1" ] ; then
		set -x
		install_$1
	else
		echo "usage: $0 <component>"
		grep -e '^install_.*(' $0 | sed 's/install_/\t/; s/(.*//'
	fi
}

main $1
