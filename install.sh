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
	wait_for_startup &> /dev/null
}

install_stop() {
	docker-compose stop
}

install_clear() {
	docker-compose down
}

wait_for_startup() {
	while ! curl localhost/status ; do sleep 1; done
}

usage() {
	PROG=$(basename "$0")
	echo "usage: $PROG <command> [...]"
	cat $PROG | grep -e '^install_' | sed 's/install_/\t/; s/(.*//'
}

main() {
	cd "$(dirname "$0")"

	case $1 in ""|-h|--help) usage; exit 0;; esac

	for cmd in $*; do
		( set -x; install_$cmd )
	done
}

main $*
