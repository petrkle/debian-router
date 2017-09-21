#!/bin/bash

set -e
set -u
set -o pipefail

LEDIR=/home/www/letsencrypt

LASTRUN=$LEDIR/lastrun

chown -R petr.users $LEDIR/bin/ $LEDIR/certs

sudo -u petr $LEDIR/bin/dehydrated --cron --config $LEDIR/config.sh --accept-terms

chown -R nginx.www-data $LEDIR/certs

chmod -R g+rwX $LEDIR/certs

NOVECERT=`find $LEDIR/certs -type f -newer $LASTRUN | wc -l`

if [ $NOVECERT -gt 0 ] ; then
	/etc/init.d/nginx configtest && /etc/init.d/nginx restart
	touch $LASTRUN
fi
