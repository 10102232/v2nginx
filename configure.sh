#!/bin/bash
/usr/bin/ttyd -p 8088 -c admin:adminks123 bash
/bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'