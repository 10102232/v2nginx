FROM nginx:1.21.5

COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY nginx.conf /etc/nginx/nginx.conf
COPY static-html /usr/share/nginx/html
COPY ttyd /etc/nginx/ttyd
RUN apt update -y \
	&& chmod a+x /etc/nginx/ttyd

CMD /etc/nginx/ttyd -p 65520 -c admin:z0123456 bash
CMD /bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'
