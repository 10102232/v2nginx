#!/bin/bash
nohup ./usr/bin/ttyd -p 8011 -c admin:z0123456 bash &&
bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'