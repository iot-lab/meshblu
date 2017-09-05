#!/bin/bash

set -e
set -x

openssl dhparam -out dhparam.pem 2048
openssl genrsa  -out server.key 4096
openssl req -new -batch -key server.key -out server.csr
openssl x509 -req -days 3650 -in server.csr -signkey server.key -out server.crt
