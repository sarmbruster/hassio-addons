#/bin/bash

if [ ! -d /config/homegear ]; then
  cp -r /etc/homegear /config
fi
rm -rf /etc/homegear
ln -s /config/homegear /etc

sleep 10000000
#/start.sh