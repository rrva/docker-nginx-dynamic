#!/usr/bin/env python
import docker
import etcd
import os

docker_cli = docker.Client(base_url=os.environ.get('DOCKER_HOST','unix://var/run/docker.sock'), version='1.12', timeout=10)
etcd_cli = etcd.Client(host='etcd')
running_containers = docker_cli.containers()
networking = [docker_cli.inspect_container(x)["NetworkSettings"] for x in running_containers]
upstream_host = [x["IPAddress"] for x in networking if "8080/tcp" in x["Ports"] ]
try:
	etcd_cli.delete('/myapp/upstream',recursive=True)
except:
	print("No keys to delete")
upstream_list = ",".join([x+':8080' for x in upstream_host])
etcd_cli.write('/myapp/upstream',upstream_list)
print "Wrote /myapp/upstream {v}".format(v=upstream_list)
