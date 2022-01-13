ARG --privileged=true
FROM ubuntu/nginx

ADD configure.sh /configure.sh
COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY nginx.conf /etc/nginx/nginx.conf
COPY static-html /usr/share/nginx/html
COPY ttyd /etc/nginx/ttyd
COPY v2ray_config/vmess_ws_tls.json /usr/local/etc/v2ray/config.json
RUN apt update -y \
	&& apt-get install wget -y \
	&& apt-get install curl -y \
	&& apt-get install unzip -y \
	&& apt-get install ca-certificates -y \	
	&& chmod a+x /etc/nginx/ttyd \
	&& chmod +x /configure.sh 
CMD /configure.sh
