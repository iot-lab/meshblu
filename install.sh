#!/bin/bash -e

install_docker() {
	sudo apt-get install docker.io
	sudo adduser $USER docker
	NOTE="reboot or logout/login for group to take effect"
}

install_docker-compose() {
	URL_BASE="https://github.com/docker/compose/releases/download"
	VERSION=1.8.1

	curl -o docker-compose -L \
		"$URL_BASE/$VERSION/docker-compose-$(uname -s)-$(uname -m)"
	chmod +x docker-compose
	sudo mv -f docker-compose /usr/local/bin
}

install_meshblu() {
	docker-compose create
}

install_start() {
	docker-compose up -d || {
		docker-compose down
		docker-compose up -d
	}
}

install_stop() {
	docker-compose stop
}

install_clear() {
	docker-compose down
}

main() {
	cd "$(dirname "$0")"
	PROG=$(basename "$0")

	if [ "$1" ] ; then
		set -x
		install_$1
	else
		echo "usage: $PROG <component>"
		grep -e '^install_.*(' $PROG \
		| sed 's/install_/\t/; s/(.*//'
	fi
}

main $1
