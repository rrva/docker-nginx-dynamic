docker stop nginx
docker rm nginx
docker build -t rrva/nginx .
#docker run -p 80:80 --link etcd:etcd --name nginx -i rrva/nginx
