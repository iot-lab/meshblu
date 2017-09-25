Meshblu
=======

This project contains the configuration files needed for
the deployment of a running instance of Meshblu (v2).

[![build][build-icon]][build-page]

[build-icon]: https://travis-ci.org/iot-lab/meshblu.svg?branch=master
[build-page]: https://travis-ci.org/iot-lab/meshblu/builds


Requirements
------------

  **Docker**: see [here][docker_install] for install, or run:

	./install.sh docker


  **docker-compose**: see [here][compose_install] for install, or run:

	./install.sh docker-compose


Usage
-----

To bring everything up:

	./install.sh start

To stop everything:

	./install.sh stop

To check it works:

	curl http://localhost/status

	or

	pip install pytest
	pytest

To run "non-daemon" with logs in your terminal:

	docker-compose up



See also: [meshblu@github][meshblu_github]

[docker_install]:  https://www.docker.com/products/overview
[compose_install]: https://docs.docker.com/compose/install
[meshblu_github]:  https://github.com/octoblu/meshblu
