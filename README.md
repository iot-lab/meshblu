This is the Meshblu deployment / configuration repository

you need docker:

	sudo apt-get install docker
	sudo adduser $USER docker
	sudo reboot # for group to take effect


you need docker-compose 1.8.1

	sudo apt-get remove docker-compose

	sudo curl -o /usr/local/bin/docker-compose -L \
	 "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)"
	sudo chmod +x /usr/local/bin/docker-compose
