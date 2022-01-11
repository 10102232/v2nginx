#!/bin/bash
/bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'

/usr/bin/ttyd -p 8088 -c admin:z0123456 bash