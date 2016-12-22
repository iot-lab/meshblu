# About

This project contains the configuration files needed for the deployment of a running instance of Meshblu (v2).

---

## Requiremments

- **Docker**: see [here](https://www.docker.com/products/overview) how to get it or run the following instructions if you're a `Debian`/`Ubuntu` user:


```
sudo apt-get install docker
sudo adduser $USER docker
sudo reboot # for group to take effect
```


- **docker-compose** (1.8.1): find [here](https://docs.docker.com/compose/install/) the instructions or take a leap of faith with the following commands (`Debian` / `Ubuntu`)

```
sudo apt-get remove docker-compose
sudo curl -o /usr/local/bin/docker-compose -L \
	"https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)"
sudo chmod +x /usr/local/bin/docker-compose
```

---

## Usage

To bring everything up:

	docker-compose up

---

## Issues

Post here or... contact the [experts](https://github.com/octoblu) :)
