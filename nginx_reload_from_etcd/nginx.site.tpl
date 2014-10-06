upstream myapp {
	{{ $hosts := split .upstream "," }}
    {{range $server := $hosts}}server {{$server}};
    {{end}}
}

server {
listen 80;
server_name localhost;
	

		location / {
				add_header X-Has-Upstreams "{{.upstream}}";
				add_header X-Upstream $upstream_addr;
				proxy_pass http://myapp;
				proxy_redirect off;
				proxy_set_header Host $host;
				proxy_set_header X-Real-IP $remote_addr;
				proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		}
}
