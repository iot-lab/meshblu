# About

This project contains the configuration files needed for the deployment of a running instance of Meshblu (v2).

---

## Requirements

- **Docker**: see [here][docker_install] for install, or run:

	./install.sh docker


- **docker-compose** (1.8.1): see [here][compose_install] for install, or run:

	./install.sh docker_compose
---

## Usage

To bring everything up:

	docker-compose up


To check it works:

	curl http://localhost/status


---

## Issues

Post here or... contact the [experts][meshblu_github] :)


[docker_install]:  https://www.docker.com/products/overview
[compose_install]: https://docs.docker.com/compose/install
[meshblu_github]:  https://github.com/octoblu
