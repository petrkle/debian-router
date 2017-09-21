#!/bin/bash

set -e

for foo in {{ pillar['fpm_pools']|join(' ') }}
do
	        nice -19 ionice -c 3 find {{ pillar.phpsessiondir }}/$foo -type f -name "sess_*" -mtime +21 -delete
done
