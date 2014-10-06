#!/usr/bin/env bash
cd dropwizard_helloworld
mvn package
docker build -t rrva/dropwizard-helloworld .
rm -rf target
cd ..
cd nginx_reload_from_etcd
docker build -t rrva/nginx .
