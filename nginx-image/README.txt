Add HTTPS support to Meshblu
============================

Meshblu comes with a built-in HTTP server,
but has no support for HTTPS.  This needs to be
provided by a separate web server.  We use nginx
for this and create a ready-to-use docker container.

Required nginx configurations files are provided in
this directory, certificates and hdparam files are
generated and the overall docker-compose addition
is provided as a patch.

The generated server certificates are self-signed,
causing potential issues e.g. with python requests.
To install an official server certificate, simply
copy server .crt and .key files in this dir and
re-build the docker image.



1. Generate server certificates and hdparam
-------------------------------------------

	./make-ssl-certs.sh


2. Add https-nginx service in docker-compose
--------------------------------------------

	cd ..
	patch -p0 < nginx-image/add_https_server.patch


3. Create the nginx docker image
--------------------------------

	docker-compose build nginx-https


4. Restart docker components
----------------------------

	./install.sh stop start


5. Check it works
-----------------

	curl -k https://localhost/status
