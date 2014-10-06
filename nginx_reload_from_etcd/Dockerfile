FROM nginx

ADD ./services-start.sh /bin/services-start.sh
ADD ./nginx-reload.sh /bin/nginx-reload.sh
ADD ./sentinel /usr/local/bin/sentinel
RUN mkdir /etc/sentinel
ADD ./nginx.site.tpl /etc/sentinel/nginx.site.tpl
ADD ./config.yml /etc/sentinel/config.yml
CMD ["/bin/bash","/bin/services-start.sh"]
