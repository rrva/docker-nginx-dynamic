if [ -f /var/run/nginx.pid ]; then
	echo reloading
	nginx -s reload
else
	echo not reloading
fi;
