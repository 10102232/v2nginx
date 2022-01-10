#!/bin/bash
/bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'

/etc/nginx/ttyd -p 8011 -c admin:z0123456 bash
