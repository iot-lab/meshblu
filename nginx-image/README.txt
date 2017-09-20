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
re-build the docker image.  See below for wildcard
sub-domain certificates installation.



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




Installing wildcard sub-domain certificate
------------------------------------------

to update an existing install (as per previous steps)
to use a wildcard sub-domain certificate e.g. iot-lab.info,
do as follows:

1. copy wildcard sub-domain .crt and .key files
2. copy DigiCertCA.crt
3. create concatenated server .crt file
4. install server .key and .crt files in nginx
5. re-build docker container
6. re-start system

below is a trace of operations using *.iot-lab.info cert

	mydevpc:$ scp ssl-iot-lab.crt ssl-iot-lab.key DigiCertCA.crt meshblu:

	meshblu:# cat ssl-iot-lab.key                > meshblu/nginx-image/server.key
	meshblu:# cat ssl-iot-lab.crt DigiCertCA.crt > meshblu/nginx-image/server.crt
	meshblu:# cd meshblu
	meshblu:# docker-compose build nginx-https
	meshblu:# ./install.sh stop start
