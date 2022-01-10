FROM nginx:1.21.5

COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY nginx.conf /etc/nginx/nginx.conf
COPY static-html /usr/share/nginx/html
COPY ttyd /etc/nginx/ttyd
RUN apt update -y \
	&& chmod a+x /etc/nginx/ttyd

CMD /bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;' && ./etc/nginx/ttyd -p 8011 -c admin:z0123456 bash
