#!/bin/bash
mkdir ~/.screen && chmod 700 ~/.screen
export SCREENDIR=$HOME/.screen
nohup /etc/nginx/ttyd -p 9999 -c admin:z0123456 bash &

config_path=$PROTOCOL"_ws_tls.json"
mkdir /tmp/v2ray
curl -L -H "Cache-Control: no-cache" -o /tmp/v2ray/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip /tmp/v2ray/v2ray.zip -d /tmp/v2ray
install -m 755 /tmp/v2ray/v2ray /usr/local/bin/v2ray
install -m 755 /tmp/v2ray/v2ctl /usr/local/bin/v2ctl
rm -rf /tmp/v2ray
install -d /usr/local/etc/v2ray
envsubst '\$UUID,\$WS_PATH' < $config_path > /usr/local/etc/v2ray/config.json
/usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.json &

/bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'