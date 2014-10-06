#!/usr/bin/env bash
docker run -d -p 7001:7001 -p 4001:4001 --name etcd coreos/etcd
docker run -d rrva/dropwizard-helloworld
docker run -d rrva/dropwizard-helloworld
./publish_nginx_containers.py
docker run -d -p 80:80 --link etcd:etcd rrva/nginx
