Docker nginx+webapp with dynamic nginx reconfig
==========

Based on brianketelsen.com/2014/02/25/using-nginx-confd-and-docker-for-zero-downtime-web-updates/

Uses https://github.com/BlueDragonX/sentinel 

Publishes all docker containers exposing 8080 to etcd key /myapp/upstream 
Sentinel watches etcd key /myapp/upstream and updates nginx config on change

          +---+sentinel                  
          |       +                      
          |       |        +------+webapp
          +       +        |             
        etcd+--+nginx+-----+             
                           |             
                           +------+webapp


#### build\_all\_docker\_containers.sh

builds all containers, needs maven since we use a java webapp in this example

#### run\_all\_docker\_containers.sh

runs an etcd container, two webapp containers and a nginx container

#### publish\_nginx\_containers.py

publishes all containers exposing :8080 to etcd:/myapp/upstream

#### republish webapp containers to nginx

you can start/stop further webapp container and run

publish\_nginx\_containers.py

to see changes in nginx config

curl -I nginx-public-ip:80

Look for X-Upstream HTTP header
