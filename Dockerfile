FROM nginx:1.21.5

ADD configure.sh /configure.sh
COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY nginx.conf /etc/nginx/nginx.conf
COPY static-html /usr/share/nginx/html
COPY ttyd /etc/nginx/ttyd
RUN apt update -y \
	&& chmod a+x /etc/nginx/ttyd \
	&& chmod +x /configure.sh 
CMD /configure.sh